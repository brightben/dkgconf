" Title: Switch Encoding for vim
" Author: darkgerm

let s:encodings = ['utf-8', 'big5', 'gbk', 'sjis']
let s:now = 0

function! SwitchEncoding()
    let s:now += 1
    if s:now >= len(s:encodings)
        let s:now = 0
    endif
    execute "set fencs=" . s:encodings[s:now]
    execute "e!"
endfunction

nmap <C-c> :call SwitchEncoding()<CR>

