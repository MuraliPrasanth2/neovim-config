return {
    -- This plugin is for providing the line highlight in the left sdie of the code to indicate the blocks seperately.
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup()
    end
}
