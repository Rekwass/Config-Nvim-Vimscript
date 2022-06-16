" This must be first, because it changes other options as a side effect.
set nocompatible
set scrolloff=999

" Adds include for the gf command USE gd INSTEAD
" :set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/include/sys
" :set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/include

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all the plugins.
let mapleader = ","
let maplocalleader = ","

" ================ General Config ====================

set encoding=utf-8
set nu rnu                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set ts=4 sw=4                   "Set indentation to be 4 spaces
set expandtab                   "YES
set nofixendofline              "Removes auto \n when leaving a file

" ====================================================

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

"turn on syntax highlighting
syntax on
filetype plugin indent on

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Give more space for displaying messages.
set cmdheight=2
" Sets the maximum number of recommendations to 20
set pumheight=20

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

source $HOME/.config/nvim/plugin_install/all_plugins.vim

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set colorscheme

"colorscheme nordfox
colorscheme onedark

" Keep undo history across sessions, by storing in a tmp file.
set undofile
if (!isdirectory("/tmp/undodir"))
  silent !mkdir /tmp/undodir
endif
set undodir=/tmp/undodir


" =============== Indentation ===============

"set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
set tabstop=4
set expandtab

" =============== Line Break ===============

set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually
set linebreak                       "Wrap lines at convenient points


" =============== Folds ===============

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" =============== Xclip ================

set clipboard=unnamedplus
set nocp

let g:python3_host_prog = '/opt/homebrew/bin/python3'

" =============== Clangd Format ================

" Separate c file as a new type
augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" =============== Random ================

" Allows nvim to find my aliases (from my .zshrc)
set shellcmdflag=-ic

" =============== Plugin Config ================

source $HOME/.config/nvim/plugin_config/vim_airline.vim
source $HOME/.config/nvim/plugin_config/vim_better_whitespace.vim
source $HOME/.config/nvim/plugin_config/git_messenger.vim
source $HOME/.config/nvim/plugin_config/indentline.vim
source $HOME/.config/nvim/plugin_config/instant.vim
source $HOME/.config/nvim/plugin_config/markdown-preview.vim
source $HOME/.config/nvim/plugin_config/nerdcommenter.vim
source $HOME/.config/nvim/plugin_config/nerdtree.vim
source $HOME/.config/nvim/plugin_config/vim_rainbow.vim
source $HOME/.config/nvim/plugin_config/vim-clang-format.vim
source $HOME/.config/nvim/plugin_config/black.vim

" =============== My Mappings ===============

source $HOME/.config/nvim/mappings/plugins.vim
source $HOME/.config/nvim/mappings/default.vim
