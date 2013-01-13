
"  This vim colorscheme is based on murphy

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "murphyme"

"hi Normal     ctermfg=none       guifg=none
hi Comment     ctermfg=LightRed
hi Constant    ctermfg=darkgreen
hi Identifier  ctermfg=lightcyan
hi Ignore      ctermfg=black
hi PreProc     ctermfg=lightBlue
hi Special     ctermfg=darkRed
hi Statement   ctermfg=DarkYellow
hi Type        ctermfg=darkcyan
hi Error       ctermbg=Red ctermfg=White
hi Todo        ctermbg=DarkYellow ctermfg=Black guifg=Blue guibg=Yellow

hi cErrInParen ctermbg=None ctermfg=None

hi MatchParen ctermbg=DarkBlue

hi LineNr       ctermfg=Grey
hi StatusLine   ctermbg=Black ctermfg=Grey
hi StatusLineNC ctermbg=Black ctermfg=Grey
hi VertSplit    ctermbg=Black ctermfg=Grey

hi Directory  ctermfg=LightCyan
hi ErrorMsg   ctermbg=DarkRed ctermfg=White
hi MoreMsg    ctermfg=LightGreen
hi NonText    ctermfg=Blue
hi Question   ctermfg=LightGreen
hi SpecialKey ctermfg=LightBlue
hi Title      ctermfg=LightMagenta
hi WarningMsg ctermfg=LightRed
