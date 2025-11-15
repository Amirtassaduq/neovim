return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      '                                   ',
      '   ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮╭─╮   ',
      '   │││├┤ │ │╰┐┌╯││││├┤    ',
      '   ╯╰╯╰─╯╰─╯ ╰╯ ┴╯ ╯╰─╯   ',
      '                                   ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '  Find file', ':Telescope find_files <CR>'),
      dashboard.button('r', '  Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('c', '  Configuration', ':e ~/.config/nvim/init.lua <CR>'),
      dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
    }

    local function footer()
      local total_plugins = #vim.tbl_keys(packer_plugins or {})
      return ' ' .. total_plugins .. ' plugins loaded'
    end

    dashboard.section.footer.val = footer()

    alpha.setup(dashboard.config)
  end,
}
