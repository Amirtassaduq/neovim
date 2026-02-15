return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()

    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- Override the filename section
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_filename = function()
      local result = '%f' -- filename
      if vim.bo.modified then
        result = result .. ' ⬤' -- green dot with transparent bg
      end
      if vim.bo.readonly then
        result = result .. ' ' -- read-only lock icon
      end
      return result
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v | ' .. os.date '%I:%M %P'
    end --  Check out: https://github.com/echasnovski/mini.nvim

    require('mini.comment').setup() -- handles commenting

    -- require('mini.bufremove').setup({})

    vim.api.nvim_set_hl(0, 'ModifiedDot', {
      fg = '#00ff00', -- Green text
      bg = 'None', -- Transparent background (inherits from statusline)

      bold = true,
    })




  end,
}
