-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode without reaching for Esc. Both jj and jk are mapped (use whichever
-- your fingers prefer); remove either line if it ever fires mid-word by accident.
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Ergonomics (Mac): redo without the awkward Ctrl-r pinky reach.
-- `u` = undo (default), now `U` (Shift+u) = redo — a clean, symmetric pair.
-- (U's default job, "undo all changes on one line", is rarely used.)
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Swap 0 and ^: the easy single-key `0` jumps to the first real character (what you
-- usually want in indented code); the harder `^` now goes to the true column 0.
-- Applied to normal/visual/operator modes so d0, v0, etc. stay consistent. Safe with
-- counts — Vim only treats `0` as a motion when it is the first key (10j still works).
vim.keymap.set({ "n", "x", "o" }, "0", "^", { desc = "First non-blank char" })
vim.keymap.set({ "n", "x", "o" }, "^", "0", { desc = "Start of line (column 0)" })
