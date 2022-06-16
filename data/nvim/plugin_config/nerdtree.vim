" ========== Nerdtree ==========

" Show hidden files
let NERDTreeShowHidden=1

" Ignore files and folders
let NERDTreeIgnore=['\.git$', '\.vscode$', '\.clangd$', '\.cache$', 'node_modules$', '\.o$', '\.a$', '\.gca$', '\.gcno$']

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Setup icons
set encoding=UTF-8

" NERDTree-git icons
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'~',
                \ 'Staged'    :'✭',
                \ 'Untracked' :'✚',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" NERDTree-git show ignored status
let g:NERDTreeGitStatusShowIgnored = 1

" Align NERDTree-git icons
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
