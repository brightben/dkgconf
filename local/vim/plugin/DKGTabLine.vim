" Title:        vim's tabline setting
" Author:       darkgerm <darkgerm@gmail.com>

" Usage:
"       put this file in ~/.vim/plugin/
"       and have fun with DKGTabeLine !

set showtabline=2

" highilght:
"  has Sel trail: active tab page
"  no  Sel trail: not active tab page
hi TabLine     cterm=underline    ctermbg=Blue   ctermfg=Grey
hi TabLineSel  cterm=none         ctermbg=Black  ctermfg=Green
hi TabLineFill cterm=underline    ctermbg=Blue   "fill the other place

" colors defined by myself
hi TabLineMod     cterm=underline ctermbg=Blue   ctermfg=Red
hi TabLineModSel  cterm=none      ctermbg=Black  ctermfg=Red
hi TabLineBuf     cterm=underline ctermbg=Blue   ctermfg=Cyan
hi TabLineBufSel  cterm=none      ctermbg=Black  ctermfg=Cyan
hi VIMlogo        cterm=none      ctermbg=DarkGreen    ctermfg=Black

function! DKGTabLine()
    """ main tabline function
    """ return: a tabline string
    """ ref: ":help setting-tabline"
    
    let s = []
    
    " iterate over the tabs
    for i in range(tabpagenr('$'))
        
        " get the tab's buffer list
        let buflist = tabpagebuflist(i+1)
        let buflen = len(buflist)
        
        " get the buffer that focus on
        let winnr = tabpagewinnr(i+1)
        let buffer = buflist[winnr-1]
        
        " get the buffer name and ismodified
        let bufname = fnamemodify(bufname(buffer), ':t')
        let ismodified = getbufvar(buffer, '&modified')  " 1/0
        
        
        " tab label format:
        "   <buflen> <name> [+]
        
        if i+1 == tabpagenr()
            let bufcolor = '%#TabLineBufSel#'
            let tabcolor = '%#TabLineSel#'
            let modcolor = '%#TabLineModSel#'
        else
            let bufcolor = '%#TabLineBuf#'
            let tabcolor = '%#TabLine#'
            let modcolor = '%#TabLineMod#'
        endif
            
        if buflen != 1
            call add(s, bufcolor. buflen)
        endif
        call add(s, tabcolor. ' '. bufname. ' ')
        if ismodified == 1
            call add(s, modcolor. '[+]')
        endif
        
        call add(s, '%#TabLine#|')
    endfor
    
    " after the last tab fill with TabLineFill and reset tab page nr
    call add(s, '%#TabLineFill#%T')
    
    " right-align the VIM logo
    call add(s, '%=%#VIMlogo# VIM Editor ')
     
    "echomsg 's: ' . join(s, '')
    return join(s, '')
endfunction

" the tabline may vary, so we need to use expression
set tabline=%!DKGTabLine()

