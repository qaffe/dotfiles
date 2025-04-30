return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{"nvim-lua/plenary.nvim"},
			{"olimorris/persisted.nvim"},
			{"andrewberty/telescope-themes"},
		},
		opts = function()
			return {
				defaults = {
					mappings = {
						n = {
							[":q<cr>"] = require("telescope.actions").close,
							["q"] = require("telescope.actions").close,	-- why are these not default bindings
						},
					},
				},
				extensions = {
					persisted = {
						layout_config = {width = 0.55, height = 0.55}
					},
				},
			}
		end,
	}
}
