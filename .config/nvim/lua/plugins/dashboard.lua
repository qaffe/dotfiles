return {
	{
		"nvimdev/dashboard-nvim",
		dependencies = {
			{"nvim-tree/nvim-web-devicons"},
		},
		event = "VimEnter",
		opts = function()
			local plugin_count = require("lazy").stats().count or 0
			return {
				theme = "doom",
				config = {
					header = {
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣾⣿⣿⣿⣿⣿⣿⣖⣾⣦⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⢸⣷⣦⣠⠀⠤⠐⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⢻⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⢸⡏⢸⣿⣳⣯⣿⣹⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⣿⢿⣿⡿⢸⣿⣿⣿⢻⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⢸⢀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⢹⢸⣿⠁⢸⣿⣿⣿⠞⠛⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠸⠁⠘⣿⣽⢿⣿⣿⣿⣯⢹⣿⣿⠏⠀⠒⢒⣊⣉⣝⣸⣇⣀⣸⣿⣿⣿⠀⠄⣹⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢟⡾⣽⣿⣿⣿⠿⢾⣿⠏⠀⠀⠀⠀⣏⢿⡿⢛⡇⠀⢺⣿⣿⡏⠀⢠⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠋⣓⢺⡏⠀⠀⠀⠀⠀⠈⢒⢒⣉⠀⠈⣸⣿⣿⢃⣰⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⠀⠠⠄⠀⠀⠀⠘⠻⠿⡟⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣟⣿⣿⣿⣿⣧⠹⢿⣿⣷⣦⣄⢀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⠀⠀⡀⠀⠉⠉⠉⠁⠉⠉⠀⣇⣷⣤⡀⠀⠋⠀⠀⢀⡀⠜⠀⠀⢀⣴⡎⣿⣿⣻⣿⣿⣿⣿⣿⡀⠀⠉⠉⠉⠁⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⢀⠄⠚⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣧⣶⣤⣀⣀⡀⠤⢐⣨⣼⣿⣷⣿⢷⣿⣿⣿⣿⣿⡼⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⢈⠀⢁⠇⠀⠀⠀⠀⠀⠀⠀⣟⡽⣏⢿⣽⣿⣿⣯⣶⣶⣿⣿⣿⣿⣿⣹⢯⣿⣿⣿⣟⣿⣿⣿⣯⣂⣀⣀⢀⢀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⠀⣰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣏⣯⣿⣿⣿⣿⣿⣯⣿⣿⣿⣿⣍⠁⠀⠀⠀⠀⠀⠀⠀",
						"⠀⠀⠀⢰⣿⡇⠀⠈⢦⣤⡄⣀⣠⣤⣶⣿⣿⣿⣷⡿⣷⡿⣿⣻⣽⣾⣿⣿⣿⣽⣿⣾⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣷⣤⡀⠐⠀⠁⠀⠂",
						"⠀⠀⠀⠘⣮⣳⣠⣴⣿⡿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⠿⣻⠿⠷⠦⠀⠁⡀",
						"⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣧⣿⣿⣿⣿⡷⣄⣀⠂⠬⡐⢄⠠",
						"",
						"",
						"[ N E O V I M - v " .. vim.version().major .. "." .. vim.version().minor .. " ]",
						"[ Loaded " .. plugin_count .. " plugins ]",
						"",
						"",
					},

					center = {
						{
							desc = "Find File                     ",
							keymap = "",
							key = "f",
							icon = "  ",
							action = "Telescope find_files",
						},

						{
							desc = "Recents",
							keymap = "",
							key = "r",
							icon = "  ",
							action = "Telescope oldfiles",
						},

						{
							desc = "Browse Files",
							keymap = "",
							key = "b",
							icon = "  ",
							action = "Yazi cwd",
						},

						{
							desc = "New File",
							keymap = "",
							key = "n",
							icon = "  ",
							action = "enew",
						},

						{
							desc = "Load Sessions",
							keymap = "",
							key = "l",
							icon = "  ",
							action = "Telescope persisted",
						},

						{
							desc = "Update Plugins",
							keymap = "",
							key = "u",
							icon = "  ",
							action = "Lazy update",
						},

						{
							desc = "Check Plugin Status",
							keymap = "",
							key = "e",
							icon = "  ",
							action = "Lazy check",
						},

						{
							desc = "System Config",
							keymap = "",
							key = "c",
							icon = "  ",
							action = "Telescope find_files hidden=true search_dirs=~/dotfiles/",
						},

						{
							desc = "Exit",
							keymap = "",
							key = "q",
							icon = "  ",
							action = "exit",
						},
					},
					footer = function()
						return {
							"",
							vim.g.startup_time_string,
						}
					end,
				},
			}
		end,
	},
}
