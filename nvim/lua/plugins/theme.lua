return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup()
			vim.cmd([[colorscheme everforest]])

			-- Make inactive windows darker
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#232a2e", fg = "#d3c6aa" })
		end,
	}
}
