return { {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-fzf-native.nvim", build = "make"
        },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope");
        local actions = require("telescope.actions");
        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        --   ["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })
        telescope.load_extension("fzf");
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>faf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "grep search in cwd" })     -- grep search fora any word that we are going to type in the popup box
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>",
            { desc = "grep search the string under the cursour in the cwd" })                             --grep search for the word under the cursour
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "search in neovim help" }) --grep search for the word under the cursour
        -- keymap.set("n", "/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "search in neovim help" }) --grep search for the word under the cursour
        keymap.set("n", "<leader>fgc", "<cmd>Telescope git_commits<cr>", { desc = "find in git commits" })
        keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches<cr>", { desc = "find in git branches" })
        keymap.set("n", "<leader>fgb", "<cmd>Telescope git_branches<cr>", { desc = "find in git branches" })
        keymap.set("n", "<leader><leader>", "<cmd>Telescope git_files<cr>", { desc = "find in git files" })
    end
}, {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
        -- This is your opts table
        require("telescope").setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                }
            }
        }
        -- To get ui-select loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require("telescope").load_extension("ui-select")
    end
}
}
