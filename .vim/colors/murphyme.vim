
"  This vim colorscheme is based on murphy

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "murphyme"

hi Normal     ctermfg=white ctermbg=black guibg=black guifg=white
hi Comment     ctermfg=Lightred guifg=#ff8080
hi Constant    ctermfg=lightgreen guifg=#80ff80
hi Identifier  ctermfg=lightcyan guifg=#00ffff
hi Ignore      ctermfg=black guifg=black
hi PreProc     ctermfg=LightBlue guifg=#8080ff
hi Special     ctermfg=Lightred guifg=#ff8080
hi Statement   ctermfg=Yellow guifg=#ffff00
hi Type        ctermfg=LightMagenta guifg=#ff80ff
hi StorageClass ctermfg=lightgrey guifg=#a0a0a0
hi Error       ctermbg=Red guibg=Red ctermfg=White guifg=White
hi Todo        ctermbg=DarkYellow guibg=DarkYellow ctermfg=Black guifg=Black

hi cErrInParen ctermbg=None ctermfg=None

hi MatchParen ctermbg=DarkBlue guibg=DarkBlue

hi LineNr       ctermfg=Grey guifg=Grey
"hi CursorLine   cterm=bold
hi CursorLineNR ctermfg=White guifg=White
hi StatusLine   cterm=none ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey
hi StatusLineNC cterm=none ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey
hi VertSplit    cterm=none ctermbg=Black guibg=Black ctermfg=Grey guifg=Grey

hi Directory  ctermfg=LightCyan guifg=#00ffff
hi ErrorMsg   ctermbg=DarkRed guibg=#800000 ctermfg=White guifg=White
hi MoreMsg    ctermfg=LightGreen guifg=#80ff80
hi NonText    ctermfg=Blue guifg=Blue
hi Question   ctermfg=LightGreen guifg=#80ff80
hi SpecialKey ctermfg=LightBlue guifg=#8080ff
hi Title      ctermfg=Yellow guifg=#ffff00
hi WarningMsg ctermfg=LightRed guifg=#ff8080

hi NERDTreeExecFile ctermfg=lightgreen guifg=#80ff80
hi NERDTreeDir ctermfg=lightblue guifg=#8080ff
hi NERDTreeUp ctermfg=lightblue guifg=#8080ff
hi NERDTreeDirSlash ctermfg=lightgrey guifg=#c0c0c0
hi NERDTreeOpenable ctermfg=lightgrey guifg=#c0c0c0
hi NERDTreeClosable ctermfg=yellow guifg=#ffff00
