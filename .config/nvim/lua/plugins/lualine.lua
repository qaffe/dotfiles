local lualine_theme = {
	normal = {
		a = { fg = "#ff9eff", bg = "#0b0a0d" },
		b = { fg = "#73ff84", bg = "#0b0a0d" },
		c = { fg = "#73ff84", bg = "#0b0a0d" },
		x = { fg = "#73ff84", bg = "#0b0a0d" },
		y = { fg = "#fff398", bg = "#0b0a0d" },
		z = { fg = "#ff9eff", bg = "#0b0a0d" },
	},
	insert = { a = { fg = "#0b0a0d", bg = "#73ff84" } },
	visual = { a = { fg = "#0b0a0d", bg = "#ff6e6e" } },
	replace = { a = { fg = "#0b0a0d", bg = "#6eebff" } },
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
		},
		opts = function()
			return {
				options = {
					icons_enabled = true,
					theme = lualine_theme,
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_a = {
						{
							"buffers",
						},
					},
				},
			}
		end,
	}
}
