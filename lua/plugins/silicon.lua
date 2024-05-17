return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("silicon").setup({
			-- Configuration here, or leave empty to use defaults
			font = "JetBrains Mono NL=34;Noto Color Emoji=34",
            theme = "Dracula",
            background = "#94e2d5"
		})
	end
}
