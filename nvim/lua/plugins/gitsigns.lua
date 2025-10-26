return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "–" },
        changedelete = { text = "_" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]g", function()
          if vim.wo.diff then
            return "]g"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[g", function()
          if vim.wo.diff then
            return "[g"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "gs", gs.stage_hunk)
        map("n", "gr", gs.reset_hunk)
        map("v", "gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "gS", gs.stage_buffer)
        map("n", "gu", gs.undo_stage_hunk)
        map("n", "gR", gs.reset_buffer)
        map("n", "gp", gs.preview_hunk)
        map("n", "gb", function()
          gs.blame_line({ full = true })
        end)
        map("n", "gd", gs.diffthis)
      end,
    })
  end,
}

