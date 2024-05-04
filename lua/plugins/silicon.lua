return {
    "krivahtoo/silicon.nvim",
    tag = "0.2.0",
    build = "./install.sh",
    config = function()
        require('silicon').setup({
            font = 'FantasqueSansMono Nerd Font=16',
            theme = 'Monokai Extended',
        })
    end,
}
