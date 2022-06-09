local options = {noremap = true, silent = true}
local terminal_options = {silent = true}
local keymap = vim.api.nvim_set_keymap

-- Normal mode

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", options)
keymap("n", "<C-Down>", ":resize -2<CR>", options)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", options)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", options)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", options)
keymap("n", "<A-h>", ":bprevious<CR>", options)

-- Move line up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", options)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", options)

-- Telescope
keymap("n", "<leader>f", "<CMD>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>", options)
keymap("n", "<leader>t", "<CMD>Telescope live_grep<CR>", options)


-- Visual mode

-- Indent
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", options)
keymap("v", "<A-k>", ":m .-2<CR>==", options)


-- Visual block mode

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", options)


---- Terminal mode

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", terminal_options)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", terminal_options)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", terminal_options)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", terminal_options)

