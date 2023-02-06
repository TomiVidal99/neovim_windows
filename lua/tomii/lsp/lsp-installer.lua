local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local util = lspconfig.util

-- auto format on save
vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

-- Register a handler that will be called for all installed servers.
lsp_installer.setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

-- Import options from the other files
local on_attach = require("tomii.lsp.handlers").on_attach
local capabilities = require("tomii.lsp.handlers").capabilities
local lsps_opts = { on_attach = on_attach, capabilities = capabilities }

-- LPSs
local lsp_list = {
  "clangd",
  "tsserver",
  "diagnosticls",
  "tailwindcss",
  "emmet_ls",
  "cssls",
  "pyright",
  "jsonls",
}

for _, lsp in pairs(lsp_list) do
  lspconfig[lsp].setup(lsps_opts)
end

-- TODO: think how to change the lsp_list to accept custom settings
-- LUA
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("tomii.lsp.settings.sumneko_lua"),
})

-- TODO: move all this config to a different directory
-- C#
--local pid = vim.fn.getpid()
--local omnisharp_executable = "C:\\ProgramData\\chocolatey\\lib\\omnisharp\\tools\\omnisharp"
--lspconfig.omnisharp.setup({
--  capabilities = capabilities,
--  on_attach = on_attach,
--  cmd = { omnisharp_executable, "--languageserver", "--hostPID", tostring(pid) },
--  enable_editorfiletypes = { 'cs', 'vb' },
--  root_dir = function(fname)
--    return util.root_pattern '*.sln' (fname) or util.root_pattern '*.csproj' (fname)
--  end, config_support = true,
--  enable_ms_build_load_projects_on_demand = false,
--  enable_roslyn_analyzers = false,
--  organize_imports_on_format = false,
--  enable_import_completion = false,
--  sdk_include_prereleases = true,
--  analyze_open_documents_only = false,
--})

-- Custom LSPs
local custom_lsps = {
  "rust_hdl",
  "bash_language_server",
  "hdl_checker",
--  "omnisharp",
}
for _, lsp in pairs(custom_lsps) do
  lspconfig[lsp].setup(lsps_opts)
end

-- mason-lspconfig allows me to automatically configure all installed LPSs
-- Though the configs must exists in the lspconfig.
require("mason-lspconfig").setup_handlers({
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup(lsps_opts)
  end,
})
