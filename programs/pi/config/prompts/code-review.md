---
description: Understand a PR; write REVIEW.md
---
Run: `gh pr view` and `gh pr diff`

Then, analyze the diff and inspect relevant files until the motivation and implications of the change are completely understood, then write a concise report to `REVIEW.md`. Do not edit any other project files.

The report should include a summary of the change, and a plain-english explanation of each step of the change in order of importance.

The goal of this document is to enable the reviewer of the PR to:
- Efficiently understand the change
- Effectively review the change

Structure:

```markdown
# Code Review

## Summary

<overview: what this PR does and why>

## Changes

1. <added, modified, or deleted>: <file name>
- <what change was made and why>
- ...
2. ...
```

