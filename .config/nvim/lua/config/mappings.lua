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
