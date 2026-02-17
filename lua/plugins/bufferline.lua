return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- for file icons
  },
  opts = {
    options = {
      mode = 'buffers', -- "buffers" | "tabs"
      numbers = 'none', -- "none" | "ordinal" | "buffer_id" | "both"
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      indicator = {
        style = 'icon', -- "icon" | "underline" | "none"
      },
      buffer_close_icon = '×',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = 'nvim_lsp', -- "false" | "nvim_lsp" | "coc"
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = 'thin', -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' }
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
    },
  },
  config = function(_, opts)
    require('bufferline').setup(opts)

    -- Keymaps for bufferline
    local keymap = vim.keymap.set

    -- Buffer navigation
    keymap('n', '<leader>bp', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    keymap('n', '<leader>bn', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    -- keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
    -- keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })

    -- Buffer management
    -- keymap('n', '<leader>bd', '<cmd>Bdelete<CR>', { desc = 'Delete buffer' })
    keymap('n', '<leader>bD', '<cmd>BufferLineSortByDirectory<CR>', { desc = 'Sort by directory' })
    keymap('n', '<leader>bE', '<cmd>BufferLineSortByExtension<CR>', { desc = 'Sort by extension' })

    -- Pick buffers
    keymap('n', '<leader>bb', '<cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
    keymap('n', '<leader>bC', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick buffer to close' })

    -- Group management
    keymap('n', '<leader>bgs', '<cmd>BufferLineGroupClose ungrouped<CR>', { desc = 'Close ungrouped' })
    keymap('n', '<leader>bgt', '<cmd>BufferLineGroupToggle docs<CR>', { desc = 'Toggle docs group' })
  end,
}
