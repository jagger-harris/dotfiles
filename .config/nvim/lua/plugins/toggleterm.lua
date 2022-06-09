local toggleterm = require("toggleterm")

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
	size = 11,
	open_mapping = [[<c-\>]],
	shading_factor = 2,
	direction = "horizontal"
})

function _G.set_terminal_keymaps()
    local options = {noremap = true}
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], options)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], options)
end

