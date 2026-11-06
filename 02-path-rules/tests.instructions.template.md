---
applyTo: "{{TEST_GLOBS}}"
---

# Test Rules

- Use Vitest and existing helpers in `{{TEST_HELPERS_PATH}}`.
- Structure tests as Arrange/Act/Assert.
- Test one behaviour per test and name that behaviour.
- Replace real network and database calls with controlled test doubles.
- Cover invalid readings, payment failures and tariff boundaries when relevant.
- Use synthetic NMIs such as `TEST000001`; never use customer records.
