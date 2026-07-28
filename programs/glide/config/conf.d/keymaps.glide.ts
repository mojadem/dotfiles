glide.keymaps.set("normal", "<leader>c", "config_reload");
glide.keymaps.set("normal", "<leader>t", "tab_new");

glide.keymaps.set(
  "normal",
  "<leader>D",
  ({ tab_id }) => {
    browser.windows.create({ tabId: tab_id });
  },
  { description: "Detach the current tab into a new window" },
);
