-- Normal mode: move line up and down
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { noremap = true })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { noremap = true })

-- move line up and down while in visual mode
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true })

-- duplicate selected up and down
vim.keymap.set('n', '<A-S-Down>', ':t.<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-S-Up>', ':t-1<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-S-Down>', ":t'><CR>gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-S-Up>', ":t'<-1<CR>gv", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename variable/function' })

-- Normal mode deletions
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')
vim.keymap.set('n', 'D', '"_D')

-- Visual mode deletions
-- vim.keymap.set('v', 'x', '"_x')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('v', 'D', '"_D')

-- Change operations (c, cc, C also delete text)
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 'cc', '"_cc')
vim.keymap.set('n', 'C', '"_C')
vim.keymap.set('v', 'c', '"_c')

-- Substitute (s, S)
vim.keymap.set('n', 's', '"_s')
vim.keymap.set('n', 'S', '"_S')
vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes

-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
-- vim.keymap.set('n', '<C-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
-- Alternative: Single key shortcuts (easier to press)
vim.keymap.set('n', '<leader>z0', 'zR', { desc = 'Open all folds' })
vim.keymap.set('n', '<leader>z1', 'zM', { desc = 'Close all folds' })
vim.keymap.set('n', '<leader>zj', 'zj', { desc = 'Next fold' })
vim.keymap.set('n', '<leader>zk', 'zk', { desc = 'Previous fold' })

-- commented out because tab key conflict with ctrl+i
-- Normal mode: indent/outdent line
-- vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })

-- commented out because tab key conflict with ctrl+i
-- Visual mode: indent/outdent selection
-- vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
-- vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })


-- Split Management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split [V]ertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split [H]orizontally' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits [E]qual' })
vim.keymap.set('n', '<leader>wx', ':close<CR>', { desc = 'Close current split' })

-- Navigation (Move between splits like VS Code)
-- This allows you to use Ctrl + hjkl to jump windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top split' })

--(mini bufremove)
-- Close buffer without closing the split window 
-- vim.keymap.set('n', '<leader>bk', function()
--   local bd = require('mini.bufremove').delete
--   if vim.bo.modified then
--     local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
--     if choice == 1 then
--       vim.cmd.w()
--       bd(0, false)
--     elseif choice == 2 then
--       bd(0, true)
--     end
--   else
--     bd(0, false)
--   end
-- end, { desc = '[X] Close Buffer (Keep Split)' })

-- close buffer without closing the split (vanilla neovim way)
vim.keymap.set('n', '<leader>bd', function()
  local current_buf = vim.api.nvim_get_current_buf()
  -- Try to switch to the previous buffer
  vim.cmd('bprevious')
  local new_buf = vim.api.nvim_get_current_buf()

  -- If we are still on the same buffer (meaning it's the only one open)
  -- create a new empty one instead
  if current_buf == new_buf then
    vim.cmd('enew')
  end

  -- Finally, delete the original buffer
  vim.cmd('confirm bd ' .. current_buf)
end, { desc = 'Close Buffer, Preserve Split' })

