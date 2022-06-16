" =============== My Mappings ===============

" Insert mode to Normal mode by pressing jk or kj
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" Made navigation easier

nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Replaces highlighted text

vnoremap <C-r> "hy:%s/<C-r>h/<C-r>h/gc<left><left><left>

" Add a shortcut to use buffers easily

nnoremap <leader>T :enew<CR>
nnoremap <leader>j :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Shortcut to fly instead of riing my bike

nnoremap <leader>b :ls<cr>:b<space>
