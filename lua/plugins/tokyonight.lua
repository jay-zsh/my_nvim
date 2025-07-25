return {
	"folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- 高优先级
	opts = {
		style = "moon",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd("colorscheme tokyonight")
	end,
}
