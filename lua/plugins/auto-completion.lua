return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp"
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})
		local key = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		key("i", "<c-d>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		key("s", "<c-d>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
		key("i", "<c-u>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
		key("s", "<c-u>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
	end,
}
