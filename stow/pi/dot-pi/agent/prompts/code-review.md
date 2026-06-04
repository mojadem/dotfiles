---
description: Understand a PR; write REVIEW.md
---
Run: `gh pr view` and `gh pr diff`

Then, analyze the diff and inspect relevant files until the motivation and implications of the change are completely understood, then write a concise report to `REVIEW.md`. Do not edit any other project files.

The report should include a summary of the change, and an explanation of each hunk in order of importance.

Structure:

```markdown
# Code Review

## Summary

<overview: what and why>

## Hunks

### 1. <file>
<what changes and why>
<diff>

### 2. ...
```

