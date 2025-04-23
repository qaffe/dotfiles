vim.g.nvim_start_time = vim.loop.hrtime() -- get startup time

-- NVIM OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true

-- INITIALIZE PLUGINS
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('echasnovski/mini.nvim') -- mini.nvim
Plug('nvim-lua/plenary.nvim') -- plenary.nvim
Plug('nvim-telescope/telescope.nvim') -- telescope
Plug('nvimdev/dashboard-nvim') -- dashboard
Plug('echasnovski/mini.hipatterns') -- mini highlight patterns
Plug('echasnovski/mini.icons') -- mini icons
Plug('lukas-reineke/indent-blankline.nvim') -- indent line

vim.call('plug#end')

-- PLUGIN CONFIG
local hipatterns = require('mini.hipatterns') -- mini highlight patterns
hipatterns.setup({
	highlighters = {
		-- highlight hex colour strings (`#rrggbb`) using that colour
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

local ibl = require('ibl') -- indent line
ibl.setup({
	exclude = {filetypes = {"dashboard"}}
})

local dashboard = require('dashboard') -- dashboard
local plugin_count = #(vim.fn.keys(vim.g.plugs or {})) -- get plugin count
dashboard.setup({
	theme = 'doom',
	config = {
		disable_move = 'true',
		shortcut_type = 'number',
		header = { -- tomoko my beloved 
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
			action = "Telescope file_browser",
		    },

		    {
			desc = "New File",
			keymap = "",
			key = "n",
			icon = "  ",
			action = "enew",
		    },

		    {
			desc = "Load Last Session",
			keymap = "",
			key = "L",
			icon = "  ",
			action = "SessionLoad",
		    },

		    {
			desc = "Update Plugins",
			keymap = "",
			key = "u",
			icon = "  ",
			action = "PlugUpdate",
		    },

		    {
			desc = "Check Plugin Status",
			keymap = "",
			key = "e",
			icon = "  ",
			action = "PlugStatus",
		    },

		    {
			desc = "Config",
			keymap = "",
			key = "c",
			icon = "  ",
			action = "Telescope find_files cwd=~/.config/nvim",
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
			local elapsed = (vim.loop.hrtime() - vim.g.nvim_start_time) / 1e6
			return {
				'',
				('[ Startup time: %.2f ms ]'):format(elapsed),
			}
		end,
	},
})
