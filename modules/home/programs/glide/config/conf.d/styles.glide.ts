glide.styles.add(
  `
    #tabbrowser-tabs {
      counter-reset: glide-tab-index;
    }

    .tabbrowser-tab {
      counter-increment: glide-tab-index;
    }

    .tabbrowser-tab .tab-label::before {
      content: counter(glide-tab-index) ": ";
    }
  `,
  { id: "tab-index" },
);
