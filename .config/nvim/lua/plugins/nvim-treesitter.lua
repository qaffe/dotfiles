return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"vim",
					"python",
				},
				sync_install = false,
				highlight = {enable = true},
				indent = {enable = true},
			})
		end
	}
}
