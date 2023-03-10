
if exists('g:loaded_vlspa') || &cp
  finish
endif

func! s:vlspa_cmdMenu()

     " variation of command-types
    let cmds = [
			\ "LspRename",
			\ "LspReferences",
            \ "LspDeclaration",
            \ "LspDefinition",
            \ "LspDocumentDiagnostics",
			\ "LspStopServer",
            \ ]

    " callback for menu-popup
    func! s:selectedCommand(id, cmd) closure
        if a:cmd == -1  " menu was canceled
            return
        endif
        " execute selection; NOTE menu-items ided from 1
        exe cmds[a:cmd-1]
    endfunc

	call popup_menu(['Rename', 'Find references', 'Go to declaration', 'Go to definition',
			\        'Run code diagnostics', 'Stop diagnostics engine'], #{
			\ title: "LSP Actions",
            \ callback: 's:selectedCommand',
			\ filter: 'popup_filter_menu',
			\ close: 'click',
			\ highlight: 'Question', border: [], padding: [1,1,0,1],
			\ pos: 'botleft', line: 'cursor-1', col: 'cursor', moved: 'WORD',
            \ })
endfunc

nnoremap  <F11> :call <SID>vlspa_cmdMenu()<cr>

let g:loaded_vlspa = 1
" vim: ft=vim :
