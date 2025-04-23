-- NVIM OPTIONS
vim.opt.number = true
vim.opt.relativenumber = true

-- INITIALIZE PLUGINS
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('echasnovski/mini.nvim') -- mini.nvim
Plug('nvimdev/dashboard-nvim') -- dashboard
Plug('echasnovski/mini.hipatterns') -- mini highlight patterns
Plug('echasnovski/mini.icons') -- mini icons
Plug('lukas-reineke/indent-blankline.nvim') -- indent line

vim.call('plug#end')


-- PLUGIN CONFIG
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		-- Highlight hex colour strings (`#rrggbb`) using that colour
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
local ibl = require('ibl')
ibl.setup({
	exclude = {filetypes = {"dashboard"}}
})
local dashboard = require('dashboard')
dashboard.setup({
	-- config here when i feel like it
})
