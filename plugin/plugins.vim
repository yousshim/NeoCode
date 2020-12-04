" Load packager only when you need it
function! PackagerInit() abort
    packadd vim-packager
    call packager#init({ 'default_plugin_type': 'opt' })
    call packager#add('kristijanhusak/vim-packager')

    call packager#add('nvim-treesitter/nvim-treesitter')
    call packager#add('sainnhe/sonokai')
    call packager#add('Shougo/deoplete.nvim')
    call packager#add('autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' })
    call packager#add('sirver/UltiSnips')
    call packager#add('honza/vim-snippets')
    call packager#add('Shougo/denite.nvim')
    call packager#add('airblade/vim-gitgutter')
    call packager#add('jreybert/vimagit')
    call packager#add('puremourning/vimspector')
    call packager#add('itchyny/lightline.vim')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
