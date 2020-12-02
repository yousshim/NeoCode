" Load packager only when you need it
function! PackagerInit() abort
    packadd vim-packager
    call packager#init({ 'default_plugin_type': 'opt' })
    call packager#add('kristijanhusak/vim-packager')

    call packager#add('nvim-treesitter/nvim-treesitter')
    call packager#add('Shougo/deoplete.nvim')
    call packager#add('sirver/UltiSnips')
    call packager#add('honza/vim-snippets')
    call packager#add('autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' })
    call packager#add('puremourning/vimspector')
    call packager#add('airblade/vim-gitgutter')
    call packager#add('jreybert/vimagit')
    call packager#add('sainnhe/sonokai')
    call packager#add('itchyny/lightline.vim')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

function! Layer_Options()
    set number
    set relativenumber
    set nowrap
    set nocompatible
    set tabstop=4
    set shiftwidth=4
    set shiftround
    set expandtab
    set termguicolors
    set noshowmode
    set laststatus=2
    set t_Co=256
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set hidden
endfunction


function! Layer_UI()
    packadd nvim-treesitter
    packadd sonokai
    let g:sonokai_style = 'andromeda'
    let g:sonokai_enable_italic = 1
    let g:sonokai_disable_italic_comment = 1
    colorscheme sonokai
    let g:lightline = {
        \ 'colorscheme': 'sonokai',
        \ }
    packadd lightline.vim
endfunction

function! Layer_Snippets()
    packadd UltiSnips
    packadd vim-snippets
endfunction

function! Layer_LanguageClient()
    let g:LanguageClient_serverCommands = {
                \'typescript': ['typescript-language-server', '--stdio']
                \}
    packadd LanguageClient-neovim
endfunction

function! Layer_AutoComplete()
    let g:deoplete#enable_at_startup = 1
    packadd deoplete.nvim
endfunction

function! Git()
    packadd vim-gitgutter
    packadd vimagit
endfunction

function! Debugger()
    packadd vimspector
endfunction

call Layer_Options()
call Layer_UI()
autocmd VimEnter *.ts call Layer_LanguageClient()
autocmd InsertEnter *.(py|ts) call Layer_AutoComplete() | call Layer_Snippets()
