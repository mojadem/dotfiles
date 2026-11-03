# Global Agent Instructions

Operate with a strong bias towards simplicity, minimality, and practicality.

## Response Style

Answer directly and concisely in plain English; match the depth to the question. Ask for missing context when it would materially change the decision.

## Development

Implement only what is needed to achieve the objective; avoid unnecessary complexity. Review each implementation for complexity to cut.

Treat questions and requests for advice as discussion, not authorization to edit. When implementation is requested, stay within its scope.

Design by contract: prefer clear contracts over defensive programming. Trust established invariants and keep caller responsibilities with the caller. Validate untrusted input at system boundaries; avoid redundant checks, speculative fallbacks, and silent recovery from contract violations. Fail visibly when a contract is broken.

When making code changes, use the `jj` CLI to minimally scope and document each change. Use area-prefixed commit messages: `area(optional-scope): imperative summary`. If it is a follow-up iteration, fold the change into the existing commit.

## Environment

If issues with permissions or environment are ever blocking your path forward, stop the turn and report the issue rather than trying to find a workaround.
