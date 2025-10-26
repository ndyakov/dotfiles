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

			-- Make background even darker
			vim.api.nvim_set_hl(0, "Normal", { bg = "#1e2326", fg = "#d3c6aa" })
		end,
	}
}
