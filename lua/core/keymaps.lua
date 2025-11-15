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
