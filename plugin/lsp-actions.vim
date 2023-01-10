
if exists('g:loaded_vlspa') || &cp
  finish
endif

func! s:vlspa_cmdMenu()

     " variation of command-types
    let cmds = [
			\ "LspReferences",
            \ "LspDeclaration",
            \ "LspDefinition",
            \ "LspDocumentDiagnostics"
            \ ]

    " callback for menu-popup
    func! s:selectedCommand(id, cmd) closure
        if a:cmd == -1  " menu was canceled
            return
        endif
        " execute selection; NOTE menu-items ided from 1
        exe cmds[a:cmd-1]
    endfunc

	call popup_menu(['Find references', 'Go to declaration', 'Go to definition', 'Run code diagnostics'], #{
			\ title: "LSP Actions",
            \ callback: 's:selectedCommand',
			\ filter: 'popup_filter_menu',
			\ close: 'click',
			\ highlight: 'Question', border: [], padding: [1,1,0,1],
			\ pos: 'botleft', line: 'cursor-1', col: 'cursor', moved: 'WORD',
            \ })
endfunc

nnoremap <buffer> <silent> X :call <SID>vlspa_cmdMenu()<cr>

let g:loaded_vlspa = 1
" vim: ft=vim :
