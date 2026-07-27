glide.addons.install(
  "https://addons.mozilla.org/firefox/downloads/file/4888680/ublock_origin-1.72.2.xpi",
  { private_browsing_allowed: true },
);
glide.addons.install(
  "https://addons.mozilla.org/firefox/downloads/file/4875950/bitwarden_password_manager-2026.6.1.xpi",
  { private_browsing_allowed: true },
);

glide.prefs.set("general.smoothScroll", false);
glide.prefs.set("browser.toolbars.bookmarks.visibility", "never");

glide.styles.add(css`
  #TabsToolbar {
    visibility: collapse !important;
  }
`);
