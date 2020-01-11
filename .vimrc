" Enable spell check and also toggle it.
set spell spelllang=en_us
cmap <F6> setlocal spell!


" Setup a simple statusline - the focus is on less clutter and just the info I need.
function! WordCount()
   let s:old_status = v:statusmsg
   let position = getpos(".")
   exe ":silent normal g\<c-g>"
   let stat = v:statusmsg
   let s:word_count = 0
   if stat != '--No lines in buffer--'
     let s:word_count = str2nr(split(v:statusmsg)[11])
     let v:statusmsg = s:old_status
   end
   call setpos('.', position)
   return s:word_count
endfunction

hi User1 ctermbg=black ctermfg=red cterm=BOLD guibg=black guifg=red gui=BOLD
set laststatus=2
set statusline=
set statusline+=%1*                             " use the highlight specified above.
set statusline+=%<\                             " cut at start
set statusline+=%-40t\                          " path
set statusline+=%=                              " left/right separator
set statusline+=%10([%l,%c]%)\                  " line and column
set statusline+=(wc:%{WordCount()})             " word count

" Some journalling options
" Every time you open a journal file (create/edit), append the timestamp
autocmd VimEnter *.md $pu=strftime('[//]: #[%a, %d %b %Y %T %z]%n%n')
" Set line number
autocmd VimEnter *.md setl number
" Indicate column 120 - just to get a visual indication of an end margin.
autocmd VimEnter *.md set colorcolumn=120
" Indicate the current line.
autocmd VimEnter *.md set cursorline
