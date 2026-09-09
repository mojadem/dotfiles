---
description: Plan a change; write PLAN.md
---
Plan: $@

Inspect relevant files until the implementation is clear, then write a concise `PLAN.md`. Do not edit any other project files.

Briefly explain what is changing and why. Group file changes into atomic implementation steps, each suitable for a separate commit.

Each change should include a diff code block. If the change is purely additive, instead prefer a code block in the correct language.

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
