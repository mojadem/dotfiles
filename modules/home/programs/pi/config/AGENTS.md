# Global Agent Instructions

Operate with a strong bias towards simplicity. All complexity must be warranted.
## Response Style

Keep responses to a few sentences at most unless explicitly asked for more. The intent is that your response should minimally answer the question, and more detail can be provided on request.

## Development

### Design by Contract

Prefer clear contracts over defensive programming. Trust established invariants and keep caller responsibilities with the caller. Validate untrusted input at system boundaries; avoid redundant checks, speculative fallbacks, and silent recovery from contract violations. Fail visibly when a contract is broken.

### Version Control

When making code changes, use the `jj` CLI to minimally scope and document each change. Use area-prefixed commit messages: `area(optional-scope): imperative summary`.

## Environment

If issues with permissions or environment are ever blocking your path forward, stop the turn and report the issue rather than trying to find a workaround.
