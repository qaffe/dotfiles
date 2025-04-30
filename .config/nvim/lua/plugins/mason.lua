return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		dependencies = {
		},
		build = ":MasonUpdate",
		opts_extend = {"ensure_installed"},
		opts = {
			ensure_installed = {
				"lua-language-server",
				"vim-language-server",
				"python-language-server",
			},
		},
	}
}
