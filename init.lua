-- TOMAS VIDAL's nvim config

-- This file just loads some dependencies.
require "tomii.options"
require "tomii.plugins"
require "tomii.lsp"
require "tomii.null-ls"
require "tomii.tree-sitter"
require "tomii.completion"
require "tomii.snippets"
require "tomii.theme"
require "tomii.statusline"
require "tomii.keymaps"

-- utils (plugins that require minor setup and make your life easier)
require "tomii.utils.color-display"
require "tomii.utils.latex"
require "tomii.utils.gitsigns"
require "tomii.utils.lspsaga"
require "tomii.utils.winbar"
require "tomii.utils.commit-file"
