syntax on

" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
if &term =~ '^xterm'
  " enter vim
  let &t_ti ..= "\e[2 q"
  " leave vim
  let &t_te ..= "\e[5 q"
  " normal mode
  let &t_EI .= "\e[2 q"
  " insert mode
  let &t_SI .= "\e[5 q"
  " replace mode
  let &t_SR = "\e[4 q"
endif

set number          " Show line numbers
set laststatus=2    " Status bar
set wrap            " Automatically wrap text that extends beyond the screen length
set backspace=2     " Solve Backspace can't delete
set relativenumber
set ruler           " Show row and column ruler information
set hlsearch        " Highlight all search results
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab       " Use Space instead of tabs
set smartindent
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch       " Search for strings incrementally
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" vim-plug management
" :PlugInstall  to install the plugins
" :PlugUpdate   to install or update the plugins
" :PlugUpgrade  to update the plugin itself
" :PlugDiff     to review the changes fro the last update
" :PlugClean    to remove plugins no longer in the list
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'ycm-core/YouCompleteMe', { 'do': '$HOMEBREW_PREFIX/opt/python3/bin/python3 ./install.py --all' }
Plug 'mbbill/undotree'
Plug 'tomtom/tcomment_vim'

call plug#end()

" theme
colorscheme gruvbox
set background=dark

let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let mapleader = " "
" window split
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vsp<CR>
" Pane nav
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Undotree
nnoremap <leader>u :UndotreeToggle<CR>
" no highlight
nnoremap <leader>nh :noh<CR>

" YCM
" The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" Trim white space after save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd bufWritePre * :call TrimWhitespace()
augroup END

