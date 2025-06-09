return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		{
			{
				"nvim-telescope/telescope.nvim",
				opts = {
					pickers = {
						colorscheme = {
							enable_preview = true,
						},
						find_files = {
							hidden = true,
							find_command = {
								"rg",
								"--files",
								"--glob",
								"!{.git/*,.cache/*,libs/*,build/*,next/*,.svelte-kit/*,target/*,node_modules/*}",
								"--path-separator",
								"/",
							},
						},
					},
				},
				dependencies = { "nvim-lua/plenary.nvim" },
			},
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help tags",
		},
		{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo history" },
	},
	config = function()
		require("telescope").load_extension("undo")
	end,
}
