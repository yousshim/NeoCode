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
    call packager#add('airblade/vim-gitgutter')
    call packager#add('jreybert/vimagit')
    call packager#add('puremourning/vimspector')
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
    set showtabline=2
    set mouse=a
    let mapleader=" "
endfunction


function! Layer_UI()
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
    " auto highlight matching symbols
    " auto format on save
    " auto show help when calling function
    " auto hover over a word
    " fuzzy completion for menu
    " fuzzy completion for symbols
    " fuzzy completion for actions

    " Calls LanguageClient_contextMenu.
    " nmap <silent><Leader>lm <Plug>(lcn-menu)
    " Calls LanguageClient_textDocument_hover.
    " nmap <silent><Leader>lh <Plug>(lcn-hover)
    " Calls LanguageClient_textDocument_definition.
    nmap <silent><Leader>lgd <Plug>(lcn-definition)
    " Calls LanguageClient_textDocument_typeDefinition.
    nmap <silent><Leader>ltd <Plug>(lcn-type-definition)
    " Calls LanguageClient_textDocument_codeAction if called in normal model or LanguageClient_textDocument_visualCodeAction if called in visual mode.
    " nmap <silent><Leader>la <Plug>(lcn-code-action)
    " Calls LanguageClient_textDocument_documentSymbol.
    " nmap <silent><Leader>lt <Plug>(lcn-symbols)
    " Calls LanguageClient_textDocument_explainErrorAtPoint.
    nmap <silent><Leader>le <Plug>(lcn-explain-error)
    " Calls LanguageClient_textDocument_formatting.
    " nmap <silent><Leader>lf <Plug>(lcn-format)
    " Calls LanguageClient_diagnosticsNext.
    nmap <silent>]d <Plug>(lcn-diagnostics-next)
    " Calls LanguageClient_diagnosticsPrevious.
    nmap <silent>[d <Plug>(lcn-diagnostics-prev)
    LanguageClientStart
endfunction

function! Layer_AutoComplete()
    let g:deoplete#enable_at_startup = 1
    packadd deoplete.nvim
endfunction

function! Layer_Git()
    packadd vim-gitgutter
    packadd vimagit
endfunction

function! Layer_Debugger()
    packadd vimspector
endfunction

function! Layer_Term()
    setlocal nonumber
    setlocal norelativenumber
    tnoremap <ESC> <C-\><C-n>
endfunction

call Layer_Options()
call Layer_UI()
autocmd VimEnter *.ts call Layer_LanguageClient()
autocmd InsertEnter *.py call Layer_AutoComplete() | call Layer_Snippets()
autocmd InsertEnter *.ts call Layer_AutoComplete() | call Layer_Snippets()
autocmd TermOpen * call Layer_Term()
