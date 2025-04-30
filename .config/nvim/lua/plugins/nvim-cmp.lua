return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-cmdline"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
		},
		event = "InsertEnter",
		config = function(_, opts)
			require("luasnip.loaders.from_vscode").lazy_load()
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{name = "nvim_lsp"},
					{name = "luasnip"},
					{name = "buffer"},
				}),
				mapping = {
					["<C-e>"] = cmp.mapping.abort(),
					["<C-Enter>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, },
					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
					["<C-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), { "i", "c" }),
					["<C-k>"] = cmp.mapping.scroll_docs(-4),
					["<C-j>"] = cmp.mapping.scroll_docs(4),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{name = "buffer"}
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{name = "path"}
				}, {
					{name = "cmdline"}
				}),
				matching = {disallow_symbol_nonprefix_matching = false},
			})
		end
	}
}
