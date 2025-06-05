return {
	"git@github.com:folke/tokyonight.nvim.git",
	opts = {
		style = "moon",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
