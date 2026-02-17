--
-- return { -- Highlight, edit, and navigate code
--   'nvim-treesitter/nvim-treesitter',
--   build = ':TSUpdate',
--   main = 'nvim-treesitter.configs', -- Sets main module to use for opts
--
--   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--   opts = {
--     ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
--     -- Autoinstall languages that are not installed
--     auto_install = true,
--     highlight = {
--       enable = true,
--       -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
--       --  If you are experiencing weird indenting issues, add the language to
--       --  the list of additional_vim_regex_highlighting and disabled languages for indent.
--       additional_vim_regex_highlighting = { 'ruby' },
--     },
--     indent = { enable = true, disable = { 'ruby' } },
--     incremental_selection = {
--           enable = true,
--           keymaps = {
--             init_selection = "vv",          -- Double tap 'v' to start selecting a node
--             node_incremental = "v",         -- Tap 'v' again to expand
--             node_decremental = "V",         -- Tap 'V' (Shift+v) to shrink
--             scope_incremental = "<leader>v", -- Expand to the whole function/scope
--           },
--         },
--       },
--   -- There are additional nvim-treesitter modules that you can use to interact
--   -- with nvim-treesitter. You should go explore a few and see what interests you:
--   --
--   --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--   --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--   --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- }
--

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "vv",
          node_incremental = "v",
          node_decremental = "V",
          scope_incremental = "<leader>v",
        },
      },
      modules = {},
      sync_install = false,
      ignore_install= {},
    })
  end,
}
