---
name: test-quality-review
description: Review tests for meaningful behavioral coverage, redundancy, and implementation-detail assertions. Use for a focused test-quality audit or test simplification review.
disable-model-invocation: true
---

# Test Quality Review

Review the specified tests, or the tests affected by the current changes. Inspect the behavior they exercise and related coverage before recommending changes.

- Identify what meaningful observable behavior or contract each test uniquely protects.
- Look for redundant scenarios, assertions that merely mirror implementation details, and mocks that obscure the behavior being tested.
- Identify important gaps and coverage that should be preserved when simplifying tests. Do not remove tests mechanically or assume negative cases are unimportant.
- Prefer focused tests that protect distinct behavior over extra cases that add little confidence.

Report high-confidence findings with the relevant tests, their impact on coverage, and concrete recommendations. Review only unless changes are requested.
