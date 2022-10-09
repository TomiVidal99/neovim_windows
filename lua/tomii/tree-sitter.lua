-- Configuration for tree-sitter (syntax highlight)
local ts_config_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ts_config_ok then
  print "ERROR: tree-sitter configs not available. Called from tree-sitter.lua"
  return
end
local ts_hl_ok, ts_hl = pcall(require, "nvim-treesitter.highlight")
if not ts_hl_ok then
  print "ERROR: tree-sitter highlight not available. Called from tree-sitter.lua"
  return
end

-- Settings
ts_config.setup({
  theme = "auto",
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "comment",
    "tsx",
    "lua",
    "json",
    "html",
    "css",
    "c_sharp"
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  playground = {
    enable = true,
  }
})
