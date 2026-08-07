import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

function formatElapsed(milliseconds: number): string {
  return `${(milliseconds / 1_000).toFixed(1)}s`;
}

export default function (pi: ExtensionAPI) {
  let started: number | undefined;

  pi.on("before_agent_start", () => {
    started = Date.now();
  });

  pi.on("agent_settled", (_event, ctx) => {
    if (started === undefined) return;

    const elapsed = formatElapsed(Date.now() - started);
    ctx.ui.notify(`turn: ${elapsed}`, "info");
    started = undefined;
  });
}
