return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        {
            "nvim-telescope/telescope-fzf-native.nvim", build="make"
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
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        --   ["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })
        telescope.load_extension("fzf");
        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "grep search in cwd" }) -- grep search fora any word that we are going to type in the popup box
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "grep search the string under the cursour in the cwd" }) --grep search for the word under the cursour
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "search in neovim help" }) --grep search for the word under the cursour
    end
}

