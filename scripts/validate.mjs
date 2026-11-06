import { readdir, readFile, stat } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import MarkdownIt from 'markdown-it';
import GithubSlugger from 'github-slugger';

const root = fileURLToPath(new URL('../', import.meta.url));
const parser = new MarkdownIt();
const excluded = new Set(['.git', 'node_modules', '.validation-output']);

export function analyseMarkdown(source) {
  const tokens = parser.parse(source, {});
  const slugger = new GithubSlugger();
  const anchors = new Set();
  const links = [];
  let headings = 0;
  function visit(token) {
    if (token.type === 'link_open') links.push(token.attrGet('href'));
    if (token.type === 'image') links.push(token.attrGet('src'));
    for (const child of token.children ?? []) visit(child);
  }
  for (const [index, token] of tokens.entries()) {
    if (token.type === 'heading_open') {
      if (token.tag === 'h1') headings += 1;
      const text = (tokens[index + 1]?.children ?? [])
        .filter(child => ['text', 'code_inline'].includes(child.type))
        .map(child => child.content).join('');
      anchors.add(slugger.slug(text));
    }
    visit(token);
  }
  return { headings, anchors, links };
}

async function listFiles(directory) {
  const files = [];
  for (const entry of await readdir(directory, { withFileTypes: true })) {
    if (excluded.has(entry.name)) continue;
    const filename = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...await listFiles(filename));
    else if (entry.isFile()) files.push(filename);
  }
  return files.sort();
}

async function validate() {
  const files = await listFiles(root);
  const documents = new Map();
  const errors = [];
  let jsonCount = 0;
  let linkCount = 0;
  const relative = filename => path.relative(root, filename).replaceAll('\\', '/');
  for (const filename of files) {
    const name = relative(filename);
    if (filename.endsWith('.json')) {
      try {
        JSON.parse(await readFile(filename, 'utf8'));
        jsonCount += 1;
      } catch (error) {
        errors.push(`${name}: invalid JSON: ${error.message}`);
      }
    }
    if (filename.endsWith('.md')) {
      const document = analyseMarkdown(await readFile(filename, 'utf8'));
      documents.set(filename, document);
      if (document.headings !== 1) errors.push(`${name}: expected exactly one H1`);
    }
    if (/^0[1-6]-/.test(name) &&
        /(^|\/)(AGENTS\.md|CLAUDE\.md|GEMINI\.md|REVIEW\.md|copilot-instructions\.md|lsp\.json)$|\.instructions\.md$/.test(name)) {
      errors.push(`${name}: live instruction/configuration filename in template content`);
    }
  }
  for (const [filename, document] of documents) {
    for (const link of document.links) {
      if (!link || /^[a-z][a-z\d+.-]*:|^\/\//i.test(link)) continue;
      linkCount += 1;
      try {
        const [pathname, fragment] = link.split('#');
        const target = path.resolve(path.dirname(filename), decodeURIComponent(pathname.split('?')[0]));
        if (path.relative(root, target).startsWith('..') || path.isAbsolute(path.relative(root, target))) {
          throw new Error('link leaves the repository');
        }
        await stat(target);
        if (fragment && documents.has(target) &&
            !documents.get(target).anchors.has(decodeURIComponent(fragment))) {
          throw new Error('heading anchor does not exist');
        }
      } catch (error) {
        errors.push(`${relative(filename)}: ${link}: ${error.message}`);
      }
    }
  }
  if (errors.length) {
    console.error(errors.join('\n'));
    process.exitCode = 1;
  } else {
    console.log(`Validated ${documents.size} Markdown files, ${jsonCount} JSON files and ${linkCount} relative links.`);
  }
}

if (process.argv[1] && path.resolve(process.argv[1]) === fileURLToPath(import.meta.url)) await validate();