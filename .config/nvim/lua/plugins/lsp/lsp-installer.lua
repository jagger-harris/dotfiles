local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "bashls",
  "jsonls",
  "clangd",
  "cmake",
  "ltex",
  "marksman",
  "solang",
  "tailwindcss"
}

lsp_installer.setup{
  ensure_installed = servers
}

for _, server in pairs(servers) do
  local options = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_options = require("plugins.lsp.servers.sumneko_lua")
    options = vim.tbl_deep_extend("force", sumneko_options, options)
  end

  lspconfig[server].setup(options)
end
