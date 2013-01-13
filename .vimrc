
syntax enable
colorscheme murphyme  " Not included in this repo
set ts=4
set sw=4
set so=3
set sbr=↳\ 
set lbr
set si
set nu
set et
set fo-=t  " I can't figure out why +t is being set now.  Infuriating.
"set mouse=a
set foldlevelstart=99
set foldminlines=3

" Most of these were copied from various places on the internet.  I forgot where.

inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>


let treeExplVertical = 1
let treeExplWinSize = 24

let NERDChristmasTree = 0
let NERDTreeWinSize = 24

" Add highlighting for function definition in C++
autocmd Syntax cpp set syntax=mycpp
autocmd Syntax c set syntax=mycpp
autocmd Syntax h set syntax=mycpp

autocmd Syntax ruby set sw=2
autocmd Syntax ruby set ts=2

autocmd BufEnter *.p6 set syntax=
autocmd BufEnter *.cpp.epl set syntax=mycpp


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
