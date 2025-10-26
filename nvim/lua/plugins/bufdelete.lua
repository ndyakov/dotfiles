return {
  "famiu/bufdelete.nvim",
  config = function()
    vim.keymap.set("n", "<C-q>", ":Bdelete<CR>", { noremap = true, silent = true })
  end,
}

