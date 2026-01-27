import type { Plugin } from "@opencode-ai/plugin";

export const Notify: Plugin = async ({
  project,
  client,
  $,
  directory,
  worktree,
}) => {
  return {
    event: async ({ event }) => {
      switch (event.type) {
        case "session.idle":
          await $`terminal-notifier -message 'Session idle' -title 'opencode'`;
        case "permission.updated":
          await $`terminal-notifier -message 'Permission requested' -title 'Opencode'`;
      }
    },
  };
};
