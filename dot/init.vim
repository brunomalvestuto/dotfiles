"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/brunomalvestuto/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  call dein#add('vim-airline/vim-airline')

  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup= 1

  " Elixir
  call dein#add('slashmili/alchemist.vim')

  call dein#add('cazador481/fakeclip.neovim')

  " Find and Replace
  call dein#add('brooth/far.vim')

  " CTAGS
  call dein#add('c0r73x/neotags.nvim')
  let g:neotags_enabled=1

  call dein#add('altercation/vim-colors-solarized')

  call dein#add('airblade/vim-gitgutter')

  call dein#add('junegunn/vim-easy-align')

  " Start interactive EasyAlign in visual mode
  vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign with a Vim movement
  nmap <Leader>a <Plug>(EasyAlign)

  call dein#add('danro/rename.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('jwhitley/vim-matchit')
  call dein#add('vim-scripts/tComment')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

"End dein Scripts-------------------------

let g:vim_fakeclip_tmux_plus=1 

" Netrm NerdTree like setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 22

" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile
set showcmd
set incsearch
set laststatus=2

set encoding=utf8
set tabstop=2 shiftwidth=2 expandtab

syntax on
set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Default leader is set to \, with ',' I won't strech my finger to hit it
nmap <silent> <leader>h :silent :nohlsearch<CR>
set encoding=utf8
set tabstop=2 shiftwidth=2 expandtab
