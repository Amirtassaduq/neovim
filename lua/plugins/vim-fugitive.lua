-- Add to your plugins configuration
return {
  'tpope/vim-fugitive',
  config = function()
    -- Key mappings
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiff<CR>', { desc = 'Git diff' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Gblame<CR>', { desc = 'Git blame' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Gcommit<CR>', { desc = 'Git commit' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Gpush<CR>', { desc = 'Git push' })
  end,
}
