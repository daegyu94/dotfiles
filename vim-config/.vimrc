set nocompatible " Not compatible with original VI
set autoindent
set cindent
set smartindent
set wrap
set nowrapscan " When searching, do not return to the beginning from the end of the document
set nobackup
set noswapfile
set visualbell " Screen refresh when a key is pressed incorrectly
set ruler " Displays the current cursor position (line, column) at the bottom right of the screen
set shiftwidth=4 " 4 spaces automatic indentation
set number " Show line number
set encoding=utf-8
set fileencodings=utf-8,euckr
set tenc=utf-8
"set ignorecase
set smarttab " make <tab> and <backspace> smarter
set expandtab " space instead of tab

set incsearch " Progressive search as you enter keywords
set cursorline
hi CursorLine cterm=bold
set laststatus=2 " Show status bar
syntax enable " Syntax highlighting by format
set backspace=eol,start,indent " Backspace at the end, beginning, or indent of a line to the previous line
set history=1000

set t_Co=256 " Terminal colors support 256
set background=dark
colorscheme desert
highlight Comment term=bold cterm=bold
highlight LineNr ctermfg=grey

set colorcolumn=80 " higlight column right after max textwidth
hi ColorColumn guibg=red

filetype plugin indent on
"autocmd BufNewFile,BufRead *.c,*.h setlocal ts=8 sw=8 sts=8 noexpandtab smartindent
autocmd BufNewFile,BufRead *.py,*.cc,*.cpp,*.hpp setlocal ts=4 sw=4 sts=4 expandtab smartindent
autocmd FileType sh,yaml,xml,java setlocal ts=2 sw=2 sts=2 expandtab smartindent

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Inc_Winwidth = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Auto_Open = 0"

"ctags
set tags=./tags,tags
set tagbsearch


"cscope
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
        cs add cscope.out
else
        cs add /usr/src/linux/cscope.out
endif
set csverb

"cscope autoloading
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

let Tlist_Auto_Open =1

" cscope/vim key mappings
" 's' symbol: find all references to the token under cursor
" 'g' global: find global definition(s) of the token under cursor
" 'c' calls:  find all calls to the function name under cursor
" 't' text:   find all instances of the text under cursor
" 'e' egrep:  egrep search for the word under cursor
" 'f' file:   open the filename under cursor
" 'i' includes: find files that include the filename under cursor
" 'd' called: find functions that function under cursor calls

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
