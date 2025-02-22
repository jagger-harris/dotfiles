return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{
				"<leader>db",
				"<cmd>DapToggleBreakpoint<cr>",
				desc = "Add breakpoint at line",
			},
			{
				"<leader>dr",
				"<cmd>DapContinue<cr>",
				desc = "Start or continue debugger",
			},
			{
				"<leader>dt",
				"<cmd>DapTerminate<cr>",
				desc = "Terminate debugger",
			},
			{
				"<leader>do",
				"<cmd>DapStepOver<cr>",
				desc = "Debugger step over",
			},
			{
				"<leader>di",
				"<cmd>DapStepInto<cr>",
				desc = "Debugger step into",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapuiconfig"] = function()
				dapui.open()
			end
			dap.listeners.after.event_terminated["dapuiconfig"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapuiconfig"] = function()
				dapui.close()
			end
			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Warning", linehl = "", numhl = "" })
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		opts = {
			handlers = {},
		},
	},
	{ "mfussenegger/nvim-dap" },
}
