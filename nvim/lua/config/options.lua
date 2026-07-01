-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Don't show whitespace markers (the "-" at trailing spaces, ">" at tabs).
-- Format-on-save already strips trailing whitespace, so this is just visual noise.
vim.opt.list = false

-- Keep the cursor vertically centered: the view scrolls to keep this many lines
-- above/below the cursor, and 999 forces it to the middle of the screen — so you
-- never have to press `zz`. (Top/bottom of the file naturally can't center.)
vim.opt.scrolloff = 999
