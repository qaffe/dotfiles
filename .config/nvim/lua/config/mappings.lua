--███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
--████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
--██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
--██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
--██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
--╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

vim.keymap.set("ca", "db", "Dashboard") 						-- easier to access dashboard
vim.keymap.set("ca", "fe", "Yazi")							-- easier to access yazi
vim.keymap.set("ca", "tsc", "Telescope live_grep")					-- easier to access telescope for live grep
vim.keymap.set("ca", "tscb", "Telescope buffers sort_mru=true sort_lastused=true")	-- easier to access telescope for buffers
vim.keymap.set("ca", "dbg", "DapContinue")						-- start/continue the debugger
vim.keymap.set("ca", "brp", "DapToggleBreakpoint")					-- toggle breakpoint on line

local hardmode = true									-- hardmode (disable arrow keys)
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

