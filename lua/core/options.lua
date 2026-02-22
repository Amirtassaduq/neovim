vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.g.have_nerd_font = true
-- vim.opt.guifont = 'D2Coding ligature'
-- vim.opt.display = 'lastline'

vim.opt.foldnestmax = 10 -- Maximum nested folds
vim.opt.foldminlines = 1 -- Minimum lines to fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- 1. Remove the dots and the "plus" signs
vim.opt.fillchars:append({ fold = " ", foldopen = " ", foldsep = " ", foldclose = " " })

-- This makes the folded line look like a normal comment or subtle text
vim.api.nvim_set_hl(0, "Folded", { bg = "NONE", fg = "#ffb454"}) -- Change hex to match your theme

-- This removes the "--- 24 lines" clutter and just shows the line content
vim.opt.foldtext = ""




vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 15
vim.g.netrw_keepdir = 0
-- Prevent netrw from loading on startup, but keep it available for :Ex
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1


-- Tab behavior
vim.opt.tabstop = 2 -- Visual: TAB appears as 4 spaces
vim.opt.shiftwidth = 2 -- Indentation: >> and << use 4 spaces
vim.opt.softtabstop = 2 -- Editing: TAB key inserts 4 spaces, BACKSPACE deletes 4 spaces
vim.opt.expandtab = true -- Convert TAB keypress to spaces

-- Indentation
vim.opt.autoindent = true -- New lines inherit indentation
vim.opt.smartindent = true -- Context-aware indentation for programming
vim.opt.copyindent = true -- Copy the structure of existing indentation

-- Line wrapping
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.breakindent = true -- Maintain indent when wrapping
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true


if vim.fn.argc() > 0 then
    local path = tostring(vim.fn.argv(0))
    if vim.fn.isdirectory(path) == 1 then
        vim.cmd.cd(path)
        -- print("PWD: " .. vim.fn.getcwd())
    end
end
