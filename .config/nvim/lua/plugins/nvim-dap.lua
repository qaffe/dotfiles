return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{"nvim-neotest/nvim-nio"},
			{"rcarriga/nvim-dap-ui"},
			{"theHamsta/nvim-dap-virtual-text"},
		},

		config = function()
			local dapui = require("dapui")
			local dap = require("dap")

			dapui.setup({})
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

		end,
	}
}
