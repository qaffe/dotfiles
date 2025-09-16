return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},
		},
		config = function()
			vim.lsp.config("lua_ls", {
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
			vim.lsp.enable("lua_ls")
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust_analyzer"] = {},
				},
			})
			vim.lsp.enable("rust_analyzer")
			vim.lsp.config("pylsp", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
			vim.lsp.enable("pylsp")
			vim.lsp.config("omnisharp", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
			vim.lsp.enable("omnisharp")
		end
	}
}
