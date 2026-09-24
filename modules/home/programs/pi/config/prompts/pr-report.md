---
description: Understand a PR; write REVIEW.md
---
Run: `gh pr view` and `gh pr diff`

Then, analyze the diff and inspect relevant files until the motivation and implications of the change are completely understood and write a concise report to `REVIEW.md`.

The report should include a high level summary of the change and a recommended review order of the files, in decreasing order of importance. Do not include implementation details; follow-up questions can address them.

The goal of this report is to enable the reviewer of the PR to:
- Efficiently understand the change
- Effectively review the change

Do not edit project files or run verification steps like tests. Only gather context until you have enough to draft the report.

Adhere to the sructure below strictly.

Structure:

```markdown
# Code Review

## Summary

<overview: what this PR does and why, in one paragraph>

## Review order

1. <added, modified, or deleted>: <file name>
2. ...
```

