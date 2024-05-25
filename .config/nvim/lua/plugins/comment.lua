local plugin = {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
}

return plugin
