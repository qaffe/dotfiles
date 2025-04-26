--██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗ 
--██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
--██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
--██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
--██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
--╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

-- general settings
vim.g.start_time = vim.loop.hrtime()
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- keybinds
vim.keymap.set("ca", "db", "Dashboard") -- easier to access dashboard
vim.keymap.set("ca", "ex", "Yazi")	-- easier to access yazi

-- hardmode
local hardmode = true
if hardmode then
    -- show an error message if a disabled key is pressed
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- disable arrow keys in insert mode with a styled message
    vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Del>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<BS>', '<C-o>' .. msg, { noremap = true, silent = false })

    -- disable arrow keys in normal mode with a styled message
    vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end

vim.api.nvim_create_autocmd("VimEnter", { -- runs after the editor is ready
  callback = function()
    local startup_time_elapsed = (vim.loop.hrtime() - vim.g.start_time) / 1e6 -- calculate time elapsed between current time and start time
    vim.g.startup_time_string = ("[ Startup time: %.2f ms ]"):format(startup_time_elapsed) -- store startup time in string
  end,
})

--██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗    ██╗███╗   ██╗██╗████████╗
--██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║    ██║████╗  ██║██║╚══██╔══╝
--██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║    ██║██╔██╗ ██║██║   ██║   
--██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║    ██║██║╚██╗██║██║   ██║   
--██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║    ██║██║ ╚████║██║   ██║   
--╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝    ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   

local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("echasnovski/mini.nvim") 				-- mini.nvim
Plug("tree-sitter/tree-sitter")				-- tree-sitter
Plug("nvim-lua/plenary.nvim") 				-- plenary.nvim
Plug("nvim-telescope/telescope.nvim") 			-- telescope
Plug("olimorris/persisted.nvim")	 		-- persisted
Plug("nvimdev/dashboard-nvim") 				-- dashboard
Plug("echasnovski/mini.hipatterns") 			-- mini highlight patterns
Plug("echasnovski/mini.icons") 				-- mini icons
Plug("mikavilpas/yazi.nvim")				-- yazi.nvim
Plug("rktjmp/lush.nvim")				-- lush
Plug("lukas-reineke/indent-blankline.nvim")		-- indent line

Plug("/home/qaffe/.config/nvim/qaffe_colours")		-- lush colour scheme

vim.call("plug#end")

--██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
--██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
--██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
--██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
--██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
--╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 

local hipatterns = require("mini.hipatterns") 					-- mini highlight patterns

hipatterns.setup({
	highlighters = {
		-- add TODO, FIX, etc here later
	},
}) 

local ibl = require("ibl") 							-- indent line
ibl.setup({
	exclude = {filetypes = {"dashboard"}}
})

local telescope = require("telescope") 						-- telescope
telescope.setup({
	defaults = {
		-- defaults here
	},
	extensions = {
		persisted = {
			layout_config = {width = 0.55, height = 0.55}
		},
	},
})
telescope.load_extension("persisted")


local dashboard = require("dashboard") 						-- dashboard
local plugin_count = #(vim.fn.keys(vim.g.plugs or {})) -- get plugin count
dashboard.setup({
	theme = "doom",
	config = {
		disable_move = "true",
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
				desc = "System Config",
				keymap = "",
				key = "c",
				icon = "  ",
				action = "Telescope find_files hidden=true search_dirs=~/Dotfiles/",
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
})

vim.cmd("colorscheme qaffe_colours") -- set colour scheme
