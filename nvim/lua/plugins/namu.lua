return {
  {
      "bassamsdata/namu.nvim",
      opts = {
  	global = { },
  	namu_symbols = { -- Specific Module options
  	    options = {},
  	},
      },
    -- === Suggested Keymaps: ===
    vim.keymap.set("n", "<leader>zz", ":Namu symbols<cr>", {
      desc = "Jump to LSP symbol",
      silent = true,
    }),
    vim.keymap.set("n", "<leader>zx", ":Namu workspace<cr>", {
      desc = "LSP Symbols - Workspace",
      silent = true,
    })
  }
}
