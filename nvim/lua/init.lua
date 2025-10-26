-- Set leader key BEFORE loading lazy.nvim
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Load lazy.nvim plugin manager
require("config.lazy")

-- Load core settings
require("config.settings")

-- Load keymaps
require("config.keymaps")

-- Load autocommands
require("config.autocmds")
