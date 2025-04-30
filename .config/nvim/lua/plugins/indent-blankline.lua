return {
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = {
		},
		main = "ibl",
		opts = function()
			return {
				exclude = {filetypes = {"dashboard"}},
			}
		end,
	}
}
