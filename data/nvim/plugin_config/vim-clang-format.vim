" ========== ClangFormat ==========

"Automatically call clang-format when saving a .cpp or a .hpp file
autocmd BufNewFile,BufRead *.cpp,*.hpp autocmd BufWritePre <buffer> ClangFormat
