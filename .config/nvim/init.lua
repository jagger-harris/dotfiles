--   _____                              _   _____ _____
--  |_   _|                            | | |  _  /  ___|
--    | | ___ _ __ ___  _ __   ___  ___| |_| | | \ `--.
--    | |/ _ \ '_ ` _ \| '_ \ / _ \/ __| __| | | |`--. \
--    | |  __/ | | | | | |_) |  __/\__ \ |_\ \_/ /\__/ /
--    \_/\___|_| |_| |_| .__/ \___||___/\__|\___/\____/
--                     | |
--                     |_|
--
-- NeoVIM config

--- Configuration options
require("config.options")
require("config.remaps")

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- LSP
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "autotools_ls", "bashls", "clangd", "cmake", "lua_ls", "marksman" },
	handlers = {
		lsp_zero.default_setup,
	},
})

-- Theme
vim.cmd("colorscheme night-owl")
