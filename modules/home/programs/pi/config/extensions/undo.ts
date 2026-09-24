import type {
  ExtensionAPI,
  SessionEntry,
} from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("undo", {
    description: "Undo the latest prompt and restore it to the editor",
    handler: async (_args, ctx) => {
      if (!ctx.isIdle() || ctx.hasPendingMessages()) {
        ctx.ui.notify("undo: agent is not idle", "warning");
        return;
      }

      const isUserMessage = (entry: SessionEntry) => {
        if (entry.type !== "message") {
          return false;
        }

        switch (entry.message.role) {
          case "user":
          case "bashExecution":
            return true;
          default:
            return false;
        }
      };

      const target = ctx.sessionManager
        .getBranch()
        .findLast((entry) => isUserMessage(entry));

      if (!target || !target.parentId) {
        ctx.ui.notify("undo: no target", "info");
        return;
      }

      await ctx.navigateTree(target.parentId, { summarize: false });
    },
  });
}
