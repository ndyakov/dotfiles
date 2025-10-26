-- Load lazy.nvim plugin manager
require("config.lazy")

-- Load core settings
require("config.settings")

-- Load keymaps
require("config.keymaps")

-- Load autocommands
require("config.autocmds")

-- Setup double-shift detection (like IntelliJ/GoLand)
require("config.double_shift").setup()
