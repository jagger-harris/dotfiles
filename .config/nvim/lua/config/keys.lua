local options = {silent = true}
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
keymap("n", "<leader>ff", ":Telescope find_files<CR>", options)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", options)
keymap("n", "<leader>fp", ":Telescope projects<CR>", options)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", options)

-- Nvim-Tree
keymap("n", "<A-t>", ":NvimTreeToggle<CR>", options)

-- Debugging
keymap("n", "<F4>", ":lua require('dapui').toggle()<CR>", options)
keymap("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", options)
keymap("n", "<F9>", ":lua require('dap').continue()<CR>", options)
keymap("n", "<F1>", ":lua require('dap').step_over()<CR>", options)
keymap("n", "<F2>", ":lua require('dap').step_into()<CR>", options)
keymap("n", "<F3>", ":lua require('dap').step_out()<CR>", options)

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
