local plugin = {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}

return plugin
