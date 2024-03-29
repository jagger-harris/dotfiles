local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha"
  },
  update_cwd = true,
  diagnostics = {
    enable = true
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    timeout = 500
  },
  view = {
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        {key = {"l", "<CR>", "o"}, cb = tree_cb "edit"},
        {key = "h", cb = tree_cb "close_node"},
        {key = "v", cb = tree_cb "vsplit"}
      }
    },
    number = false,
    relativenumber = false
  }
}
