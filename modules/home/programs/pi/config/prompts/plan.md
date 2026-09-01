---
description: Plan a change; write PLAN.md
---
Plan: $@

Inspect relevant files until the implementation is clear, then write a concise `PLAN.md`. Do not edit any other project files.

Briefly explain what is changing and why. Group file changes into atomic implementation steps, each suitable for a separate commit. Each change should include the actual proposed code diff.

Structure:

```markdown
# Plan: <brief description>

<overview: what is changing and why>

## Step 1: <brief summary>

### 1. `<file>`

<one-line summary of the change and why>

<code diff>

### 2. ...

## Step 2: <brief summary>

...
```
