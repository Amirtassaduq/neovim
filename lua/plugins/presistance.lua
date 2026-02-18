return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- Load when you open a file
  opts = {
    -- The directory where sessions are saved.
    -- Modern persistence uses 'state' by default, so we usually don't need to set it.
    dir = vim.fn.stdpath 'state' .. '/sessions/',
    options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
  },
  config = function(_, opts)
    require('persistence').setup(opts)
  end,
  
  keys = {
    {
      '<leader>qs',
      function()
        require('persistence').load()
      end,
      desc = 'Restore Session',
    },
    {
      '<leader>ql',
      function()
        require('persistence').load { last = true }
      end,
      desc = 'Restore Last Session',
    },
    {
      '<leader>qd',
      function()
        require('persistence').stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}
