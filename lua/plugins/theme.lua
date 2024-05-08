-- return {"rebelot/kanagawa.nvim", 
--     config = function ()
--         require("kanagawa").setup({
--             transparent = true,
--             theme = "dark",
--         })
--     end
-- }

return {
    "rebelot/kanagawa.nvim",
    config = function()
        vim.cmd("colorscheme kanagawa-wave");
    end
}
