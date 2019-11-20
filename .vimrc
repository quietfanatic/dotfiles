
set encoding=utf-8  " Not always default I guess

syntax enable
colorscheme murphyme  " Not included in this repo
set bri
set bs=indent,eol,start
set ci
set cot=menu,longest
set dy=lastline,uhex
set et
set fo-=t  " I can't figure out why +t is being set now.  Infuriating.
set foldlevelstart=99
set foldminlines=3
set gfn=Consolas:h11:cANSI:qDRAFT
set go=egrL
set is
set lbr
set mouse=a  " Make sure to install vim with +xterm_clipboard
set report=0
set sb
set sbr=^^^^^^^^
set sc
set si
set so=3
set spr
set sw=4
set title
set ts=4
set wildmode=longest,list

 " Leaving files all over the current directory is messy
set dir=~/tmp
set bdir=~/tmp
 " This is cool
set udf
set udir=~/tmp
if has("gui_running")
    set lines=32 columns=120
endif
 " Line numbers on large terminals only
if &columns > 84
    set nu
endif

 " Consistency is good.
set ve=onemore
noremap <End> $l

 " This really shouldn't be necessary.
inoremap # X#

 " Don't make me think
nnoremap <C-D> :q<CR>

let loaded_matchparen = 0

let treeExplVertical = 1
let treeExplWinSize = 24

let NERDChristmasTree = 0
let NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.hi$', '\.o$', '\.exe']
let NERDTreeMouseMode = 3  " single click to open files
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

" Add highlighting for function definition in C++
autocmd BufEnter *.cpp set syntax=mycpp2
autocmd BufEnter *.hpp set syntax=mycpp2
autocmd BufEnter *.cxx set syntax=mycpp2
autocmd BufEnter *.hxx set syntax=mycpp2
autocmd BufEnter *.cc set syntax=mycpp2
autocmd BufEnter *.c set syntax=mycpp2
autocmd BufEnter *.cs set syntax=mycpp2
autocmd BufEnter *.h set syntax=mycpp2
autocmd BufEnter *.java set syntax=mycpp2
autocmd BufEnter *.cs set syntax=mycpp2
autocmd BufEnter *.p6 set syntax=myperl6
autocmd BufEnter *.cpp.epl set syntax=mycpp2
autocmd BufEnter *.js set syntax=myjs
autocmd BufEnter *.hs set syntax=myhs
autocmd BufEnter *.ohs set syntax=myhs
autocmd BufEnter *.hacc set syntax=hacc
autocmd FileType perl set syntax=myperl
autocmd FileType perl6 set syntax=myperl6
"autocmd BufEnter *
"    \ let start = getline(1) . getline(2) . getline(3) . getline(4) . getline(5) |
"    \ if start =~? "use v6" || start =~? "unit" |
"    \   set syntax=myperl6 |
"    \ endif

autocmd Syntax ruby set sw=2
autocmd Syntax ruby set ts=2

 " Thid were copied from somewhere on the internet.  I forgot where.
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
 " As was this
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') > 1
    return '0'  " if not at start, go to start
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

 " Modified from the help file
function! CleverTab()
  if getline('.')[col('.')-2] =~ '[a-zA-Z_0-9]'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

 " Bring attention to too-long lines (is.gd/IBV2013)
"highlight ColorColumn ctermbg=darkgrey
"call matchadd('ColorColumn', '\%81v', 100)

 " Show tabs, trailing whitespace, NBSPs (is.gd/IBV2013)
set listchars=tab:·\ ,trail:·,nbsp:·
set list

 " From http://stackoverflow.com/questions/5820793/vim-get-content-of-syntax-element-under-cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

 " Make this easier (is.gd/IBV2013)
nnoremap ; :
vnoremap ; :

