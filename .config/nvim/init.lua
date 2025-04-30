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
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.pumheight = 20
vim.diagnostic.config({
	virtual_text = {spacing = 4},
	virtual_lines = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true
})

-- keybinds
vim.keymap.set("ca", "db", "Dashboard") 						-- easier to access dashboard
vim.keymap.set("ca", "fe", "Yazi")							-- easier to access yazi
vim.keymap.set("ca", "tsc", "Telescope live_grep")					-- easier to access telescope for live grep
vim.keymap.set("ca", "tscb", "Telescope buffers sort_mru=true sort_lastused=true")	-- easier to access telescope for buffers
vim.keymap.set("ca", "brp", "dap.toggle_breakpoint")					-- toggle breakpoint on line

-- hardmode
local hardmode = true
if hardmode then
	-- show an error message if a disabled key is pressed
	local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

	-- disable arrow keys in insert mode with a styled message
	vim.api.nvim_set_keymap("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })

	-- disable arrow keys in normal mode with a styled message
	vim.api.nvim_set_keymap("n", "<Up>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Down>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Left>", msg, { noremap = true, silent = false })
	vim.api.nvim_set_keymap("n", "<Right>", msg, { noremap = true, silent = false })
end

vim.api.nvim_create_autocmd("VimEnter", { -- runs after the editor is ready
	callback = function()
		local startup_time_elapsed = (vim.loop.hrtime() - vim.g.start_time) / 1e6 -- calculate time elapsed between current time and start time
		vim.g.startup_time_string = ("[ Startup time: %.2f ms ]"):format(startup_time_elapsed) -- store startup time in string
	end,
})

require("config.lazy")
vim.cmd("colorscheme qaffe_colours")
