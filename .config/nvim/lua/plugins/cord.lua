return {
	{
	  "vyfor/cord.nvim",
	  build = ":Cord update",
	  opts = {
			text = {
				default = "Editing a File",
				workspace = "In ${filetype}",
			},
			display = {
				swap_icons = true,
			},
			variables = true,
		}
	}
}
