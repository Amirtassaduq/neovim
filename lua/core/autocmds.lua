-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- Auto save session on exit
-- vim.api.nvim_create_autocmd('VimLeave', {
--   pattern = '*',
--   command = 'mksession! ~/.nvim/Session.vim',
-- })

-- Auto load session on start
-- vim.api.nvim_create_autocmd('VimEnter', {
--  pattern = '*',
--  command = 'source ~/.nvim/Session.vim',
-- })
-- Close netrw if it opens on startup, but keep netrw available
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.schedule(function()
      local buf_ft = vim.bo.filetype
      if buf_ft == 'netrw' then
        -- vim.cmd 'enew'
        vim.cmd 'bwipeout'
      end
    end)
  end,
})
