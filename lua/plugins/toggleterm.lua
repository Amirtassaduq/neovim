return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    -- Basic configuration
    size = 20,
    open_mapping = [[<c-`>]],
    direction = 'horizontal',
    shade_terminals = false,
    start_in_insert = true,
    persist_size = true,
    persist_mode = true,
    auto_scroll = true,
    -- float_opts = {
    --   border = 'curved',
    --   winblend = 0,
    -- },
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- Custom keymaps

    local Terminal = require('toggleterm.terminal').Terminal
    local keymap = vim.keymap.set

    local next_term_id = 5 -- Start after 1-4

    -- Create new terminal on demand
    keymap('n', '<leader>tn', function()
      local new_term = Terminal:new {
        direction = 'horizontal',
        count = next_term_id,
      }
      next_term_id = next_term_id + 1
      new_term:toggle()
    end, { desc = 'Create new terminal' })

    -- Terminal management
    keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
    keymap('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })

    -- Quick resize all horizontal terminals
    keymap('n', '<leader>t=', function()
      vim.cmd 'resize 20'
    end, { desc = 'Resize terminals' })

    -- Terminal navigation (when terminal is active)
    keymap('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Go to left window' })
    keymap('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Go to below window' })
    keymap('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Go to above window' })
    keymap('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Go to right window' })

    -- Exit terminal mode like Neovim
    keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
    keymap('t', '<C-[>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
  end,
}
