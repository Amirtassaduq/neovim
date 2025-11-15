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

local function toggle_netrw()
  -- Check if netrw is open in any window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    if buf_ft == 'netrw' then
      -- Close netrw if there are multiple windows
      if #vim.api.nvim_list_wins() > 1 then
        vim.api.nvim_win_close(win, true)
      else
        vim.cmd 'enew' -- Open new empty buffer instead of closing
      end
      return
    end
  end

  -- Netrw not found, open it on the right
  vim.cmd '30vs | Ex'
end

vim.keymap.set('n', '<leader>e', toggle_netrw, { desc = 'Toggle file explorer' })
