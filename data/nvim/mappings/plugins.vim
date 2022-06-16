" =============== My Mappings ===============

" =============== Vim Tek Header ===============

nnoremap <leader>H :call <SID>DumpTekHeader()<cr>

" =============== NERDTree ===============

" Open NERDTree

nnoremap <C-n> :NERDTree<CR>

" =============== Git Messenger ===============

" Open git history

nmap <Leader>gm <Plug>(git-messenger)

" =============== Git Gutter ===============

" Show preview popup
:nmap <leader>gp :GitGutterPreviewHunk<CR>
" HighLight modified lines
:nmap <leader>gh :GitGutterLineHighlightsToggle<CR>
" Reduce unchanging lines
:nmap <leader>gf :GitGutterFold<CR>
" Go to next change
:nmap <leader>gn :GitGutterNextHunk<CR>
" Go to previous change
:nmap <leader>gN :GitGutterPrevHunk<CR>

" =============== Markdown Preview ===============

" Open in browser markdown previsualisation
nmap <C-p> :MarkdownPreviewToggle<CR>

" =============== Coc.nvim ===============

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `<leader>n` and `<leader>N` to navigate errors/warnings
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)
nmap <silent> <leader>N <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show avaible quickfixs
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix
nmap <leader>qf  <Plug>(coc-fix-current)

" Toggle coc-tabnine
nmap <leader>tn :call CocActionAsync('toggleExtension', 'coc-tabnine')<CR>

" =============== Coc-Snippets.nvim ===============

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
