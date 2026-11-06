# Meter Platform

Ingests smart-meter reads and serves billing.

TypeScript 5 · Node 20 · Fastify · Vitest · zod.

## Build & test

Run from the repository root:

```sh
npm ci && npm run build
npm test -- --run
npm run lint
```

<!-- TODO: verify -->
Run these commands in [meter-platform](https://github.com/danielhardej/meter-platform)
and record successful results before adopting this example as a live brief.
The sample application is not included or executed in this kit.

## Architecture

| Path | Responsibility |
| --- | --- |
| `services/readings` | Fastify API, one route per file; `validateReading` checks reads. |
| `services/billing` | Billing service; `handlePayment` handles payments. |
| `packages/domain` | Pure logic, no I/O; `calculateTariff` calculates tariffs. |
| `jobs/` | Python 3.12 batch jobs (pyright strict). |
| `web/` | Web client. |

## Conventions

- Validate input with zod at the edge.
- Never log NMIs or customer PII.
- Use synthetic NMIs such as `TEST000001` in examples and tests.
