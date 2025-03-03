-- INITIALIZE PLUGINS
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('echasnovski/mini.nvim') -- mini.nvim
Plug('echasnovski/mini.hipatterns') -- Highlight Patterns

vim.call('plug#end')


-- PLUGIN CONFIG
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
