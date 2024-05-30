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

        wk.register({
            --registering undotree
            ["u"] = { "<cmd>lua require('undotree').toggle()<CR>", "Undo-Tree" },

            --regestring hop
            h = {
                name = "hop/hunk"
            },

            -- regestering telescope find
            f = {
                name = "find",
                g = {
                    name = "git"
                }
            },

            -- registering treesitter selection
            s = {
                name = "selection",
            },

            -- registering togglein git-signs, not working need to check
            t = {
                name = "toggle(git-signs)"
            },

        }, { prefix = "<leader>" })
    end
}
