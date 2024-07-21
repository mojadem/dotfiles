config.load_autoconfig(False)

config.source("gruvbox.py")

c.fonts.default_family = "Monaspace Neon"
c.fonts.default_size = "14pt"

dirs = ["left", "right", "top", "bottom"]
padding = 4
c.tabs.padding = {dir: padding for dir in dirs}
c.statusbar.padding = {dir: padding for dir in dirs}

for i in range(1, 10):
    config.bind(f"<Meta-{i}>", f"tab-focus {i}", "normal")
