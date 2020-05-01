
" For startify
let s:header = [
        \ '',
        \ '  /MMMMMMMMMMMMMMMMMMMMMMMMMM+  ',
        \ ' mMMNNNNMMMMMMMMMMMMMNNNNNMMMM` ',
        \ ':MMds+:--:/ymMMMMMMmy/:..:+sdMM+',
        \ 'sMddMMhy+--``oMMMMs``.-+shMMddMy',
        \ 'hMMMMMMMMms:-yMMMMy::smMMMMMMMMd',
        \ 'mMMmy+//+sdm--NMMMyymds+//+ymMMm',
        \ 'mN/.`````../o sMMMMM+.......:shh',
        \ 'mNyhddmmmmNNo oMMMMMMNNNNNNNMMMm',
        \ '.+mMMMMMMMNh  sMMMMNMMMMMMMMMNd-',
        \ '.y./+yhhhd--. hMMMMdsMMdddyso/+ ',
        \ ' :y:/-hMMN+d/`MMMMMMmMMNmo`o-y. ',
        \ '  :d+:.-+yhdo oyy++mNmds:.s+y/  ',
        \ '   :mo:+/-.`  :do` `...:so:h/   ',
        \ '    .dy`:ydmdhhhhyyhdmNMdod:    ',
        \ '     `yh`oNmddooosMMMMMhhh.     ',
        \ '       +hoMMMM:  sMMMMdmo       ',
        \ '        -hMMMd   +MMMMm:        ',
        \ '          oMMm   /MMMs`         ',
        \ '',
        \ ' [  EnvyVim '.g:envyvim_version.' @kensai  ]',
        \ '',
        \ ]

let s:footer = [
      \ ' Stay strong, code the world!',
      \ ]

function! Envyvim_startify_center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = Envyvim_startify_center(s:header)
let g:startify_custom_footer = Envyvim_startify_center(s:footer)


autocmd VimEnter * if isdirectory(argv()[0]) | exe 'Startify' | endif
autocmd! FileType startify
autocmd  FileType startify set laststatus=0 showtabline=0
  \| autocmd BufLeave <buffer> set laststatus=2 showtabline=2
autocmd User Startified setlocal buflisted
