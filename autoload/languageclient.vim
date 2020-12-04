function! languageclient#setup()
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
    nmap <silent><Leader>lm <Plug>(lcn-menu)
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

