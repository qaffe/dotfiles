return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
		},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					Lua = {
						diagnostics = {
							globals = {"vim"},
						},
						workspace = {
							library = {
								[vim.fn.expand "$VIMRUNTIME/lua"] = true,
								[vim.fn.stdpath "config" .. "/lua"] = true,
							},
						},
					},
				},
			})

			lspconfig.pylsp.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
		end
	}
}
