
syn region myrktParen start="(" end=")" transparent contains=@myrktNormals,myrktbadSquare
syn region myrktSquare start="\[" end="]" transparent contains=@myrktNormals,myrktbadParen
syn region myrktParenD start="(" end=")" transparent contained contains=@myrktInDefine,myrktBadSquare
syn region myrktSquareD start="\[" end="]" transparent contained contains=@myrktInDefine,myrktBadParen
syn match myrktBadParen ")" contained
syn match myrktBadSquare "]" contained
syn match myrktBinding "[^()\[\]#'" \t\n]\+" contained
syn cluster myrktNormals contains=myrktParen,myrktSquare,myrktDefineFunc,myrktDefineVar,myrktLet,myrktSymbol,myrktNumber,myrktString,myrktLineComment,myrktBlockComment
syn cluster myrktInDefine contains=myrktParenD,myrktSquareD,myrktBinding
syn region myrktDefineFunc start="\%((define (\)\@<=" end=")" transparent contains=@myrktInDefine
syn match myrktDefineVar "\%((define\)\@<= [^()\[\]#'" \t\n]\+"

syn region myrktLet start="\%((let\*\? (\)\@<=" end=")" transparent contains=myrktLetGroup1
syn match myrktLetGroup1 "\[\@<=[^()\[\]#'" \t\n]\+" contained nextgroup=myrktLetGroup2
syn region myrktLetGroup2 start="" end="]" contained contains=@myrktNormals,myrktBadParen

syn match myrktSymbol "'[^()\[\]#'" \t\n]\+"
syn match myrktNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn region myrktString start=+"+ skip=+\\\\|\\"+ end=+"+

syn region myrktLineComment start=";" excludenl end="$"
syn region myrktBlockComment start="#|" end="|#"

hi def link myrktDefineVar myrktBinding
hi def link myrktLetGroup1 myrktBinding
hi def link myrktBinding Identifier
hi def link myrktSymbol myrktConstant
hi def link myrktNumber myrktConstant
hi def link myrktString myrktConstant
hi def link myrktConstant Constant
hi def link myrktLineComment myrktComment
hi def link myrktBlockComment myrktComment
hi def link myrktComment Comment
