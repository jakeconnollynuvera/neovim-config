return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- For `nvim-treesitter` users.
  priority = 49,

  -- For blink.cmp's completion
  -- source
  -- dependencies = {
  --     "saghen/blink.cmp"
  -- },
  vim.keymap.set('n', '<leader>mt', "<cmd>Markview Toggle<cr>"  , { desc = '[M]arkview [T]oggle' }),
  vim.keymap.set('n', '<leader>ms', "<cmd>Markview splitToggle<cr>"  , { desc = '[M]arkview [S]plit toggle' }),
}
