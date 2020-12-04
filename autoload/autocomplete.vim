function! autocomplete#setup()
    autocmd InsertEnter * call autocomplete#load()
endfunction

function! autocomplete#load()
    let g:deoplete#enable_at_startup = 1
    packadd deoplete.nvim
endfunction

