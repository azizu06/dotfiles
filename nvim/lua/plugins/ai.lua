return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.keymap.set("i", "<C-l>", 'copilot#accept("<CR>")', { expr = true, silent = true, noremap = true })
      vim.g.copilot_no_tab_map = true
    end,
  },
}
