return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 512,
			lsp_format = "fallback",
		},
	},
}
