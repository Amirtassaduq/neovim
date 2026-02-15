local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- 1. Highlight when yanking
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Toggle Netrw on the Right
-- vim.keymap.set('n', '<leader>e', function()
--   -- Check if netrw is already open
--   local netrw_buf_exists = false
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     local buf = vim.api.nvim_win_get_buf(win)
--     if vim.bo[buf].filetype == 'netrw' then
--       vim.api.nvim_win_close(win, true)
--       netrw_buf_exists = true
--       break
--     end
--   end
--
--   -- If not open, launch it and force it to the right
--   if not netrw_buf_exists then
--     vim.cmd('Lexplore %:p:h') -- Open explorer at current file
--     vim.cmd('wincmd L')       -- Move explorer window to the far right
--     vim.cmd('vertical resize 35') -- Explicitly set width to 35 columns
--   end
-- end, { desc = '[E]xplorer on Right' })

vim.keymap.set('n', '<leader>e', function()
  local netrw_buf_exists = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'netrw' then
      vim.api.nvim_win_close(win, true)
      netrw_buf_exists = true
      break
    end
  end

  if not netrw_buf_exists then
    -- Get the actual project root (Current Working Directory)
    local cwd = vim.fn.getcwd()
    vim.cmd('Lexplore ' .. cwd) 
    vim.cmd('wincmd L')
    vim.cmd('vertical resize 35')
  end
end, { desc = '[E]xplorer at Project Root' })
