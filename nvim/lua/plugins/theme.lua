return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard", -- Use darker background variant
			})
			vim.cmd([[colorscheme everforest]])

			-- Make background slightly darker (in between default and very dark)
			vim.api.nvim_set_hl(0, "Normal", { bg = "#20262a", fg = "#d3c6aa" })
		end,
	}
}
