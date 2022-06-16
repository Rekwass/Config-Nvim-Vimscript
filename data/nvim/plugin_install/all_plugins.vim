" ========== All plugins ==========

" Automatically install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

" Call plugins

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Nero-F/vim-tek-header'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'
Plug 'jbyuki/instant.nvim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'yggdroot/indentline'
Plug 'puremourning/vimspector'
"Plug 'frazrepo/vim-rainbow'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'psf/black'
Plug 'rhysd/vim-grammarous'
Plug 'flebel/vim-mypy', { 'for' : 'python', 'branch': 'bugfix/fast_parser_is_default_and_only_parser' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neovimhaskell/haskell-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'preservim/nerdcommenter'
Plug 'rhysd/vim-clang-format'
"Plug 'EdenEast/nightfox.nvim'
Plug 'joshdick/onedark.vim'

call plug#end()
