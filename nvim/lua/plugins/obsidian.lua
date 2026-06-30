-- Edit your Obsidian vault from inside Neovim: wikilinks, daily notes, backlinks,
-- search, and completion for [[note links]] and #tags. Maintained community fork.
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  cmd = { "Obsidian" },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: quick switch note" },
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian: search vault" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Obsidian: today's daily note" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: backlinks" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Obsidian: links in note" },
    { "<leader>og", "<cmd>Obsidian tags<cr>", desc = "Obsidian: find by tag" },
  },
  opts = {
    legacy_commands = false, -- use the modern `:Obsidian <subcmd>` interface only
    workspaces = {
      { name = "main", path = "~/Obsidian Vault" },
    },
    completion = {
      nvim_cmp = false, -- LazyVim uses blink, not nvim-cmp
      blink = true,
      min_chars = 2,
    },
    picker = {
      name = "snacks.pick", -- the picker LazyVim already ships
    },
    -- LazyVim's markdown extra already renders markdown (render-markdown.nvim);
    -- disable obsidian's own UI so they don't fight over the same buffer.
    ui = { enable = false },
  },
}
