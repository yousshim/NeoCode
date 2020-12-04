function! ui#setup()
    packadd nvim-treesitter
    packadd sonokai
    let g:sonokai_style = 'andromeda'
    let g:sonokai_enable_italic = 1
    let g:sonokai_disable_italic_comment = 1
    colorscheme sonokai

    let g:lightline = {}
    let g:lightline.colorscheme = 'sonokai'
    let g:lightline.component = {
                \ 'mode': '%n',
                \}
	let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
	let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }
    packadd lightline.vim
    call lightline#update()
endfunction

