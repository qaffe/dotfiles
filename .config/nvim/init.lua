-- NVIM OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true

-- INITIALIZE PLUGINS
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('echasnovski/mini.nvim') -- mini.nvim
Plug('echasnovski/mini.hipatterns') -- Highlight Patterns
Plug('lukas-reineke/indent-blankline.nvim')

vim.call('plug#end')


-- PLUGIN CONFIG
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight hex colour strings (`#rrggbb`) using that colour
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
require("ibl").setup()
