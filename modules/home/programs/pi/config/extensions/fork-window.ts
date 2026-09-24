import { existsSync } from "node:fs";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.registerCommand("fork-window", {
    description: "Fork the current session into a new tmux window",
    handler: async (_args, ctx) => {
      if (!process.env.TMUX) {
        ctx.ui.notify("fork-window: not in tmux", "warning");
        return;
      }

      const file = ctx.sessionManager.getSessionFile();
      if (!file || !existsSync(file)) {
        ctx.ui.notify("fork-window: no session file to fork", "warning");
        return;
      }

      const result = await pi.exec("tmux", [
        "new-window",
        "-c",
        ctx.cwd,
        "fish",
        "-ic",
        `pi --fork '${file}'`,
      ]);

      if (result.code !== 0) {
        ctx.ui.notify(`fork-window: tmux: ${result.stderr.trim()}`, "error");
      }
    },
  });
}
