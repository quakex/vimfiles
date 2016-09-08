" Don't be compatible with vi
set nocompatible 

filetype off

" Use Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/vimrc.bundles
call vundle#end()

filetype plugin indent on

" More powerful backspacing
set backspace=indent,eol,start

" Larger history storage
set history=1000

" Enalbe syntax highlighting
syntax on

" Set column limit for syntax highlighting
" to prevent longs lines slowing down the world
set synmaxcol=128 


" Optimize scrolling
set ttyfast
set ttyscroll=3
set lazyredraw

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Color settings
set t_Co=256
color tir_black
set cursorline
colorscheme solarized

" JQuery syntax support
autocmd Syntax javascript set syntax=jquery

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Matching
set showmatch       " Show matching brackets.
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set ignorecase      " Do case insensitive matching

" Status
set showcmd         " Show (partial) command in status line.
set laststatus=2    " Always show status bar 
set ruler           " Show cursor position
set number          " Show line number

" Indentation
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4 
set linespace=4

autocmd Syntax html,css,ruby,javascript,coffee,cpp,java set tabstop=2 shiftwidth=2 linespace=2

" Indent guides (default toggle key is <leader>ig)
let g:indent_guides_auto_colors=0
let g:indent_guides_start_level=2 
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=242

" Snippet


if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" SuperTab
let g:SuperTabDefaultCompletionType="<c-n>"

" Zen-coding 
let g:user_emmet_expandabbr_key='<c-j>'
let g:user_emmet_settings={
\    'indentation': '  ',
\}

" Nerd Tree 
let NERDChristmasTree=1
let NERDTreeWinSize=25

" Tab Bar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

" Tagbar
let g:tagbar_left=0
let g:tagbar_width=30

" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ [172, 172],
    \ [167, 167],
    \ [141, 141],
    \ [39, 39],
    \ [49, 49],
    \ [82, 82],
    \ [11, 11],
    \ [172, 172],
    \ [167, 167],
    \ [141, 141],
    \ [39, 39],
    \ [49, 49],
    \ [82, 82],
    \ [11, 11],
    \ [172, 172],
    \ [167, 167],
    \ ]
let g:rbpt_max = 32
autocmd Syntax lisp,scheme,clojure RainbowParenthesesActivate
autocmd Syntax lisp,scheme,clojure RainbowParenthesesLoadRound
autocmd Syntax lisp,scheme,clojure RainbowParenthesesLoadSquare
autocmd Syntax             clojure RainbowParenthesesLoadBraces

" Easymotion leader key
" These keys are easier to type than the default set
" We exclude semicolon because it's hard to read and
" i and l are too easy to mistake for each other slowing
" down recognition. The home keys and the immediate keys
" accessible by middle fingers are available 
let g:EasyMotion_keys='asdfjkoweriop'
nmap ,<ESC> ,,w
nmap ,<S-ESC> ,,b

" Key mappings
nmap <F4> :IndentGuidesToggle<cr>
nmap <F5> :NERDTreeToggle<cr>
nmap <F6> :TagbarToggle<cr>

" Extra commands 
command W w
command WQ wq
command Wq wq
command Q q
command Qa qa
command QA qa

" Nginx syntax highlighting
autocmd BufNew,BufRead,BufNewFile,BufEnter /etc/nginx/*,/usr/local/nginx/*,/usr/local/etc/nginx/* setfiletype nginx

" Slim syntax highlighting
autocmd BufNew,BufRead,BufNewFile,BufEnter *.slim setfiletype slim

" ------------------------------------------------------------------------------
" Calendar 
let g:calendar_diary="/Users/quakex/Nutstore/APP/diary"
map ;ca :Calendar<cr>

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Surround
"
" via: http://whynotwiki.com/Vim
" " Ruby
" " Use v or # to get a variable interpolation (inside of a string)}
" " ysiw#   Wrap the token under the cursor in #{}
" " v...s#  Wrap the selection in #{}
 let g:surround_113 = "#{\r}"   " v
 let g:surround_35  = "#{\r}"   " #
"
" " Select text in an ERb file with visual mode and then press s- or s=
" " Or yss- to do entire line.
 let g:surround_45 = "<% \r %>"    " -
 let g:surround_61 = "<%= \r %>"   " =

" ------------------------------------------------------------------------------
"  CtrlP
"  ------------------------------------------------------------------------------
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" Don't jump to already open window. This is annoying if you are maintaining
" several Tab workspaces and want to open two windows into the same file.
let g:ctrlp_switch_buffer = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
map ,ja :CtrlP app/assets<CR>
map ,jm :CtrlP app/models<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jv :CtrlP app/views<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jl :CtrlP lib<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jf :CtrlP fast_spec<CR>
map ,jd :CtrlP db<CR>
map ,jC :CtrlP config<CR>
map ,jV :CtrlP vendor<CR>
map ,jF :CtrlP factories<CR>
map ,jT :CtrlP test<CR>

"Cmd-Shift-(M)ethod - jump to a method (tag in current file)
"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <D-M> :CtrlPBufTag<CR>

imap <C-a> <esc>wa

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null

function! GetVisual()
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

"grep the current word using K (mnemonic Kurrent)
nnoremap <silent> K :Ag <cword><CR>

"grep visual selection
vnoremap K :<C-U>execute "Ag " . GetVisual()<CR>

"grep current word up to the next exclamation point using ,K
nnoremap ,K viwf!:<C-U>execute "Ag " . GetVisual()<CR>

"grep for 'def foo'
nnoremap <silent> ,gd :Ag 'def <cword>'<CR>

",gg = Grep! - using Ag the silver searcher
" open up a grep line, with a quote started for the search
nnoremap ,gg :Ag ""<left>

"Grep for usages of the current file
nnoremap ,gcf :exec "Ag " . expand("%:t:r")<CR>

