return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local wk = require("which-key");
        -- registering find for telescope
        wk.register({
            f = {
                name = "find"
            }
        }, { prefix = "<leader>" })

        -- registering hop
        wk.register({
            h = {
                name = "hop"
            }
        }, { prefix = "<leader>" })

        -- registering treesitter selection
        wk.register({
            s = {
                name = "selection"
            }
        }, { prefix = "<leader>" })

        -- registering lsp
        wk.register({
            ["m"] = { "<cmd>Mason<cr>", "Mason UI for Lsp" },
            ["r"] = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Reformat Code" },

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

    end
}
