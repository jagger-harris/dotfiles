return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{ "3rd/image.nvim", opts = {} },
	},
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("load_neo_tree", {}),
			desc = "Loads neo-tree when opening a directory",
			callback = function(args)
				local stats = vim.uv.fs_stat(args.file)

				if not stats or stats.type ~= "directory" then
					return
				end

				require("neo-tree")

				return true
			end,
		})
	end,
	keys = {
		{ "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	opts = {
		popup_border_style = "rounded",
		event_handlers = {
			event = "file_open_requested",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
			},
		},
		window = {
			position = "current",
		},
	},
}
