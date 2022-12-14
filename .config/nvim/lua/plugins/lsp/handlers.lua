local Handlers = {}

local cmp_nvim_lsp = require("cmp_nvim_lsp")

Handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
Handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true
Handlers.capabilities = cmp_nvim_lsp.default_capabilities(Handlers.capabilities)

Handlers.setup = function()
  local signs = {
    {name = "DiagnosticSignError", text = ""},
    {name = "DiagnosticSignWarn", text = ""},
    {name = "DiagnosticSignHint", text = ""},
    {name = "DiagnosticSignInfo", text = ""},
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(buffer)
  local options = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
  keymap(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
  keymap(buffer, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
  keymap(buffer, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
  keymap(buffer, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", options)
  keymap(buffer, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
  keymap(buffer, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", options)
  keymap(buffer, "n", "<leader>li", "<cmd>LspInfo<cr>", options)
  keymap(buffer, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", options)
  keymap(buffer, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)
  keymap(buffer, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", options)
  keymap(buffer, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", options)
  keymap(buffer, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
  keymap(buffer, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
  keymap(buffer, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", options)
end

Handlers.on_attach = function(client, buffer)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end

  if client.name == "sumneko_lua" then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(buffer)
  local illuminate = require("illuminate")

  illuminate.on_attach(client)
end

return Handlers
