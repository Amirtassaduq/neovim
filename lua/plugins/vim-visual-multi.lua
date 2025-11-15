return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    -- Basic keymaps (similar to VS Code)
    vim.g.VM_maps = {
      ['Find Under'] = '<C-d>',
      ['Find Subword Under'] = '<C-d>',
      ['Select All'] = '<C-A-n>',
      ['Start Regex Search'] = '<C-/>',
      ['Add Cursor Up'] = '<C-S-Up>',
      ['Add Cursor Down'] = '<C-S-Down>',
      ['Mouse Cursor'] = '<C-LeftMouse>',
      ['Mouse Word'] = '<C-RightMouse>',
    }
    vim.g.VM_theme = 'iceblue'
    vim.g.VM_mouse_mappings = 1
  end,
}
