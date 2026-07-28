const previousTabByWindow = new Map<number, number>();

browser.tabs.onActivated.addListener(({ previousTabId, windowId }) => {
  if (previousTabId !== undefined) {
    previousTabByWindow.set(windowId, previousTabId);
  }
});

glide.keymaps.set(
  "normal",
  "<leader>a",
  async ({ tab_id }) => {
    const { windowId } = await browser.tabs.get(tab_id);
    const previousTabId = previousTabByWindow.get(windowId!);

    if (previousTabId !== undefined) {
      await browser.tabs.update(previousTabId, { active: true });
    }
  },
  { description: "Switch to the most-recently-used tab" },
);
