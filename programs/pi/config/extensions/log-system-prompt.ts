import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("log-system-prompt", {
    description: "Write the current system prompt to ~/.pi/logs",
    handler: async (_args, ctx) => {
      ctx.ui.notify(`${ctx.getSystemPrompt()}`, "info");
    },
  });
}
