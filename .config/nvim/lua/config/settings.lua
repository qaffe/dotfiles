--███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
--██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
--███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
--╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
--███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
--╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

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
vim.cmd("colorscheme qaffe_colours")


-- for startup time
vim.api.nvim_create_autocmd("VimEnter", { -- runs after the editor is ready
	callback = function()
		local startup_time_elapsed = (vim.loop.hrtime() - vim.g.start_time) / 1e6 -- calculate time elapsed between current time and start time
		vim.g.startup_time_string = ("[ Startup time: %.2f ms ]"):format(startup_time_elapsed) -- store startup time in string
	end,
})

