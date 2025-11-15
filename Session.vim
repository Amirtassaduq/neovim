let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/.config/nvim
badd +38 lua/plugins/mini-nvim.lua
badd +2 lua/core/options.lua
badd +0 lua/plugins/vim-visual-multi.lua
badd +53 init.lua
argglobal
%argdel
$argadd ~/.config/nvim
edit lua/plugins/mini-nvim.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 30 + 31) / 63)
exe '2resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 2resize ' . ((&columns * 79 + 120) / 240)
exe '3resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 3resize ' . ((&columns * 79 + 120) / 240)
exe '4resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 4resize ' . ((&columns * 80 + 120) / 240)
argglobal
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 38 - ((18 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 38
normal! 02|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/init.lua", ":p")) | buffer ~/.config/nvim/init.lua | else | edit ~/.config/nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/init.lua
endif
balt ~/.config/nvim/lua/plugins/mini-nvim.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 54 - ((19 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 54
normal! 035|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/core/options.lua", ":p")) | buffer ~/.config/nvim/lua/core/options.lua | else | edit ~/.config/nvim/lua/core/options.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/core/options.lua
endif
balt ~/.config/nvim/lua/plugins/mini-nvim.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/plugins/vim-visual-multi.lua", ":p")) | buffer ~/.config/nvim/lua/plugins/vim-visual-multi.lua | else | edit ~/.config/nvim/lua/plugins/vim-visual-multi.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/plugins/vim-visual-multi.lua
endif
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 07|
lcd ~/.config/nvim
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 30 + 31) / 63)
exe '2resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 2resize ' . ((&columns * 79 + 120) / 240)
exe '3resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 3resize ' . ((&columns * 79 + 120) / 240)
exe '4resize ' . ((&lines * 30 + 31) / 63)
exe 'vert 4resize ' . ((&columns * 80 + 120) / 240)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
