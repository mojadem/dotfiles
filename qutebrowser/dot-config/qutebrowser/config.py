c = c  # noqa
config = config  # noqa

config.load_autoconfig(True)

bg = "#282828"
bg_dark = "#1d2021"
bg_light = "#3c3836"
fg = "#ebdbb2"
fg_dark = "#a89984"

green = "#b8bb26"
blue = "#83a598"
aqua = "#8ec07c"
yellow = "#fabd2f"
red = "#fb4934"

c.colors.statusbar.normal.bg = bg
c.colors.statusbar.normal.fg = fg
c.colors.statusbar.command.bg = bg
c.colors.statusbar.command.fg = fg
c.colors.statusbar.insert.bg = bg
c.colors.statusbar.insert.fg = fg

c.colors.tabs.bar.bg = bg_dark
c.colors.tabs.odd.bg = bg_dark
c.colors.tabs.odd.fg = fg_dark
c.colors.tabs.even.bg = bg_dark
c.colors.tabs.even.fg = fg_dark
c.colors.tabs.selected.odd.bg = bg
c.colors.tabs.selected.odd.fg = fg
c.colors.tabs.selected.even.bg = bg
c.colors.tabs.selected.even.fg = fg


c.colors.statusbar.url.fg = fg
c.colors.statusbar.url.success.http.fg = green
c.colors.statusbar.url.success.https.fg = green
c.colors.statusbar.url.hover.fg = blue
c.colors.statusbar.url.warn.fg = red
c.colors.statusbar.url.error.fg = red

c.colors.completion.category.bg = bg
c.colors.completion.category.fg = fg
c.colors.completion.category.border.bottom = bg
c.colors.completion.category.border.top = bg
c.colors.completion.odd.bg = bg
c.colors.completion.even.bg = bg
c.colors.completion.fg = blue
c.colors.completion.item.selected.fg = blue
c.colors.completion.match.fg = green
c.colors.completion.item.selected.match.fg = green
c.colors.completion.item.selected.bg = bg_light
c.colors.completion.item.selected.border.bottom = bg_light
c.colors.completion.item.selected.border.top = bg_light

c.colors.hints.fg = blue
c.colors.hints.match.fg = green
c.colors.hints.bg = bg

c.colors.webpage.preferred_color_scheme = "dark"

c.tabs.favicons.show = "never"
c.tabs.indicator.width = 0
c.tabs.max_width = 250

padding = {"bottom": 2, "top": 2, "left": 10, "right": 10}
c.statusbar.padding = padding
c.tabs.padding = padding

c.fonts.default_family = "Monaspace Neon Light"
c.fonts.default_size = "12pt"

c.url.searchengines = {
    "DEFAULT": "https://google.com/search?q={}",
    "gh": "https://github.com/{}",
}
c.url.start_pages = "https://mojadem.dev"

c.hints.chars = "arstneio"

config.bind("td", "config-cycle -p -t colors.webpage.darkmode.enabled")
