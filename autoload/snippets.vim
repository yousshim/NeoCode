function! snippets#setup()
    autocmd InsertEnter * call snippets#load()
endfunction

function! snippets#load()
    packadd UltiSnips
    packadd vim-snippets
endfunction
