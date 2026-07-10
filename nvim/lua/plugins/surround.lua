-- mini.surround — add/delete/replace surrounding pairs (parens, brackets, quotes, tags).
-- Mnemonic: "gs" = go surround. Add takes a motion or visual selection, then the char.
--   gsaiw)   add ( ) around inner word          gsa" (in visual) wrap selection in " "
--   gsd)     delete surrounding ( )             gsr)"  replace ( ) with " "
-- To remove this, delete this file.
return {
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
}
