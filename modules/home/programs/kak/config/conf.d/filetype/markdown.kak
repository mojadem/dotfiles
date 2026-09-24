require-module markdown

# Apply strike-through markup
add-highlighter -override shared/markdown/inline/text/ regex '(?<!~)(~~([^\s~]|([^\s~](\n?[^\n~])*[^\s~]))~~)(?!~)' 1:+s

# Apply strike-through to text on checked checkbox
add-highlighter -override shared/markdown/inline/text/ regex '^\h*[-*]\s\[x\]\s([^\n]*)$' 1:white+s
