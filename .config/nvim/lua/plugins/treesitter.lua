local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {""},
  highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true
  },
  indent = {enable = true, disable = { "python", "css" }},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil
	}
}
