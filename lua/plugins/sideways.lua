return {
    "andrewradev/sideways.vim",
    config = function()
        print("something")
        vim.keymap.set("n", "<leader>sl", "<cmd>:SidewaysLeft<cr>")
        vim.keymap.set("n", "<leader>sr", "<cmd>:SidewaysRight<cr>")
        vim.keymap.set("v", "<leader>sl", "<cmd>:SidewaysLeft<cr>")
        vim.keymap.set("v", "<leader>sr", "<cmd>:SidewaysRight<cr>")
    end,
}
