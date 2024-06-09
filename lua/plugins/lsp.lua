return {
	{
		-- this will help to install lsps and linters and formatters through a unified interface inside neovim instead of
		-- downloading the lsps and linters and formatters manually and placing it in the correct place.
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- this will help to bridge the gap between the nvim lsp config and the mason plugin and install the lsp programmatically without having to install
		-- it using the mason ui using the ensure_install and auto_install option.
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- installing language servers using mason-lspconfig which inturn will use the mason to install the language servers
				ensure_installed = {
					"lua_ls",
					"tsserver",
				},
				auto_install = true,
			})
		end,
	},
	{
		-- this will help to configure the language server to attach to a buffer when it is opened and detach it when its closed without needing to create this configuration with
		-- the autocommand functions and also defining the root folder in a language is tricky and will vary for each language.
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- adding config for language servers
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			-- lspconfig.pyright.setup({
			-- 	capabilities = capabilities,
			-- })

			lspconfig.emmet_language_server.setup({
				capabilities = capabilities,
			})

			require("lspconfig").html.setup({
				capabilities = capabilities,
			})
			local wk = require("which-key")
			-- To choose the formatter for the correct language( specifically to use jq for json files.)
			local function format()
				local function contains(list, content)
					for _, value in ipairs(list) do
						if value == content then
							return true
						end
					end
					return false
				end
				local supported_extensions = { "json", "eslintrc", "prettierrc" }
				local supported_filenames = { ".eslintrc", ".prettierrc" }
				local current_extension = vim.fn.expand("%:e")
				local current_filename = vim.fn.expand("%:t")

				-- print("current_extension", current_extension)
				-- print("current_filename", current_filename)
				if
					contains(supported_extensions, current_extension) or contains(supported_filenames, current_filename)
				then
					print("inside the json file conditional check positive block")
					vim.cmd(":%!jq .")
				else
					print("inside the json file conditional check negative block")
					vim.lsp.buf.format({ async = true })
				end
			end

			wk.register({
				-- registering lsp
				["m"] = { "<cmd>Mason<cr>", "Mason UI for Lsp" },
				["r"] = {
					function()
						format()
					end,
					"Reformat Code",
				},

				l = {
					name = "LSP",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					i = { "<cmd>LspInfo<cr>", "Info" },
					l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
					r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					S = {
						"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
						"Workspace Symbols",
					},
				},
			}, { prefix = "<leader>" })
			wk.register({
				-- registering lsp

				["r"] = {
					function()
						format()
					end,
					"Reformat Code",
				},
				l = {
					name = "LSP",
					a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
					l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				},
			}, { prefix = "<leader>", mode = "v" })
			wk.register({
				["gd"] = {
					function()
						vim.lsp.buf.definition()
					end,
					"go to defenition",
				},
				["gD"] = {
					function()
						vim.lsp.buf.declaration()
					end,
					"go to declaration",
				},
				["K"] = {
					function()
						vim.lsp.buf.hover()
					end,
					"hover information",
				},
				["gi"] = {
					function()
						vim.lsp.buf.implementation()
					end,
					"go to implementation",
				},
				["<C-k>"] = {
					function()
						vim.lsp.buf.signature_help()
					end,
					"signature help",
				},
				["<leader>wa"] = {
					function()
						vim.lsp.buf.add_workspace_folder()
					end,
					"add workspace folder",
				},
				["<leader>wr"] = {
					function()
						vim.lsp.buf.remove_workspace_folder()
					end,
					"remove workspace folder",
				},
				["<leader>wl"] = {
					function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end,
					"list workspace folders",
				},
				["<leader>D"] = {
					function()
						vim.lsp.buf.type_definition()
					end,
					"type defenetion",
				},
				["<leader>lr"] = {
					function()
						vim.lsp.buf.rename()
					end,
					"rename",
				},
				["gr"] = {
					function()
						vim.lsp.buf.references()
					end,
					"references list",
				},
				["<leader>df"] = {
					function()
						vim.diagnostic.open_float()
					end,
					"diagnostic in float window",
				},
				["[d"] = {
					function()
						vim.diagnostic.goto_prev()
					end,
					"go to previous diagnostic",
				},
				["]d"] = {
					function()
						vim.diagnostic.goto_next()
					end,
					"go to next diagnostic",
				},
				["<leader>q"] = {
					function()
						vim.diagnostic.setloclist()
					end,
					"diagnostic list",
				},
			})
		end,
	},
}
