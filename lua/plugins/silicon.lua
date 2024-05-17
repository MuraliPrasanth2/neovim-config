return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            -- Configuration here, or leave empty to use defaults
            font = "JetBrains Mono NL=34;Noto Color Emoji=34",
            theme = "OneHalfDark",
            background = "#ADB7C1",
            -- window_title = function()
            --     return vim.fn.fnamemodify(
            --         vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
            --         ":t"
            --     )
            -- end,
            window_title = function()
                -- return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
                return "something"
            end,
        })
    end
}
