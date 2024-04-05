return {
    'phaazon/hop.nvim',
    config = function()
        require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
        vim.keymap.set("n", "<leader>hw", "<cmd>:HopWord<cr>")
        vim.keymap.set("n", "<leader>hl", "<cmd>:HopLine<cr>")
        vim.keymap.set("v", "<leader>hw", "<cmd>:HopWord<cr>")
        vim.keymap.set("v", "<leader>hl", "<cmd>:HopLine<cr>")
    end
}
