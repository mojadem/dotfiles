import { getSupportedThinkingLevels } from "@earendil-works/pi-ai";
import {
  DynamicBorder,
  type ExtensionAPI,
} from "@earendil-works/pi-coding-agent";
import { fuzzyFilter, Input, SelectList } from "@earendil-works/pi-tui";

export default function (pi: ExtensionAPI) {
  pi.registerShortcut("ctrl+shift+t", {
    description: "Select thinking level",
    handler: async (ctx) => {
      if (ctx.mode !== "tui") return;
      if (!ctx.model) {
        ctx.ui.notify("No model selected", "warning");
        return;
      }

      const levels = getSupportedThinkingLevels(ctx.model);
      const selected = await ctx.ui.custom<string | undefined>(
        (tui, theme, keybindings, done) => {
          const border = new DynamicBorder((text: string) =>
            theme.fg("border", text),
          );
          const input = new Input();
          const items = levels.map((level) => ({ value: level, label: level }));
          const createList = () =>
            new SelectList(
              fuzzyFilter(items, input.getValue(), (item) => item.value),
              levels.length,
              {
                selectedText: (text) => theme.fg("accent", text),
                noMatch: (text) => theme.fg("muted", text),
                // no-op styles below
                selectedPrefix: (text) => text,
                description: (text) => text,
                scrollInfo: (text) => text,
              },
            );
          let list = createList();
          list.setSelectedIndex(levels.indexOf(pi.getThinkingLevel()));

          return {
            get focused() {
              return input.focused;
            },
            set focused(value: boolean) {
              input.focused = value;
            },
            render: (width) => [
              ...border.render(width),
              ...input.render(width),
              ...list.render(width),
              ...border.render(width),
            ],
            invalidate() {
              border.invalidate();
              input.invalidate();
              list.invalidate();
            },
            handleInput(data) {
              if (keybindings.matches(data, "tui.select.cancel")) {
                done(undefined);
              } else if (keybindings.matches(data, "tui.select.confirm")) {
                done(list.getSelectedItem()?.value);
              } else if (
                keybindings.matches(data, "tui.select.up") ||
                keybindings.matches(data, "tui.select.down")
              ) {
                list.handleInput(data);
              } else {
                const value = input.getValue();
                input.handleInput(data);
                if (input.getValue() !== value) list = createList();
              }
              tui.requestRender();
            },
          };
        },
      );

      const level = levels.find((level) => level === selected);
      if (level) pi.setThinkingLevel(level);
    },
  });
}
