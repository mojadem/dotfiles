import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("undo", {
    description: "Undo the latest prompt and restore it to the editor",
    handler: async (_args, ctx) => {
      if (!ctx.isIdle() || ctx.hasPendingMessages()) {
        ctx.ui.notify(
          "Stop the agent and clear queued messages before /undo.",
          "warning",
        );
        return;
      }

      const target = ctx.sessionManager
        .getBranch()
        .findLast(
          (entry) => entry.type === "message" && entry.message.role === "user",
        );

      if (!target) {
        ctx.ui.notify("No user message to undo.", "info");
        return;
      }

      await ctx.navigateTree(target.id, { summarize: false });
    },
  });
}
