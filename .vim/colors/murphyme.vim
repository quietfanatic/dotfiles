
"  This vim colorscheme is based on murphy

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "murphyme"

"hi Normal     ctermfg=none       guifg=none
hi Comment     ctermfg=Lightred
hi Constant    ctermfg=lightgreen
hi Identifier  ctermfg=lightcyan
hi Ignore      ctermfg=black
hi PreProc     ctermfg=LightBlue
hi Special     ctermfg=Lightred
hi Statement   ctermfg=Yellow
hi Type        ctermfg=darkcyan
hi StorageClass ctermfg=lightgrey
hi Error       ctermbg=Red ctermfg=White
hi Todo        ctermbg=DarkYellow ctermfg=Black

hi cErrInParen ctermbg=None ctermfg=None

hi MatchParen ctermbg=DarkBlue

hi LineNr       ctermfg=Grey
"hi CursorLine   cterm=bold
hi CursorLineNR ctermfg=White
hi StatusLine   cterm=none ctermbg=Black ctermfg=Grey
hi StatusLineNC cterm=none ctermbg=Black ctermfg=Grey
hi VertSplit    cterm=none ctermbg=Black ctermfg=Grey

hi Directory  ctermfg=LightCyan
hi ErrorMsg   ctermbg=DarkRed ctermfg=White
hi MoreMsg    ctermfg=LightGreen
hi NonText    ctermfg=Blue
hi Question   ctermfg=LightGreen
hi SpecialKey ctermfg=LightBlue
hi Title      ctermfg=LightMagenta
hi WarningMsg ctermfg=LightRed
