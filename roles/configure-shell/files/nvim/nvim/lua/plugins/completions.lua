return {
	{
		-- Provide more types of completion candidates for 'nvim-cmp'
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		-- Provide processing code snippets
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- Integrated 'LuaSnip' into 'nvim-cmp'
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		-- Provide Completion engine, used to implement window display during input
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						-- use 'luasnip' expand code Snippets
						require("luasnip").lsp_expand(args.body)
					end,
				},
				-- Completion Window style
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				-- Key binding
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					-- Define completion priorities and sources
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
