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

" Load packager only when you need it
function! PackagerInit() abort
    packadd vim-packager
    call packager#init()
    call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
    call packager#add('nvim-treesitter/nvim-treesitter')
    call packager#add('Shougo/deoplete.nvim')
    call packager#add('sirver/UltiSnips')
    call packager#add('honza/vim-snippets')
    call packager#add('autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' })
    call packager#add('puremourning/vimspector')
    call packager#add('airblade/vim-gitgutter')
    call packager#add('jreybert/vimagit')
    call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
    call packager#add('junegunn/fzf.vim')
    call packager#add('romgrk/doom-one.vim')
    call packager#add('sainnhe/sonokai')
    call packager#add('itchyny/lightline.vim')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()


let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ }

let g:deoplete#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
            \'typescript': ['typescript-language-server', '--stdio']
            \}

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF
