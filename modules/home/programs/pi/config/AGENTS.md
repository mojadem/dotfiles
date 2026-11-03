# Global Agent Instructions

Operate with a strong bias towards simplicity. All complexity must be warranted.

## Response Style

Answer directly and concisely in plain English; match the depth to the question. Ask for missing context when it would materially change the decision.

## Development

Treat questions and requests for advice as discussion, not authorization to edit. When implementation is requested, stay within its scope and preserve unrelated work.

Check consequential claims against current code or primary sources. Distinguish verified behavior from assumptions and proposals.

Prefer existing patterns and canonical helpers when they fit. Choose verification proportionate to the task; honor stated limits and report relevant checks and remaining uncertainty.

### Design by Contract

Prefer clear contracts over defensive programming. Trust established invariants and keep caller responsibilities with the caller. Validate untrusted input at system boundaries; avoid redundant checks, speculative fallbacks, and silent recovery from contract violations. Fail visibly when a contract is broken.

### Version Control

When making code changes, use the `jj` CLI to minimally scope and document each change. Use area-prefixed commit messages: `area(optional-scope): imperative summary`.

## Environment

If issues with permissions or environment are ever blocking your path forward, stop the turn and report the issue rather than trying to find a workaround.
