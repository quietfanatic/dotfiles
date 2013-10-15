
" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

 " Comments (belong everywhere)
syn region myhsLineComment start="--" excludenl end="$"
syn region myhsBlockComment start="{-" end="-}"
syn match myhsTitle "------*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?-----$"
syn cluster myhsComments contains=myhsLineComment,myhsBlockComment,myhsTitle
hi def link myhsLineComment myhsComment
hi def link myhsBlockComment myhsComment
hi def link myhsComment Comment
hi def link myhsTitle Title

 " Constants (belong in both normal expressions and patterns)
syn match myhsSpecialChar contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match myhsSpecialChar contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match myhsSpecialCharError contained "\\&\|'''\+"
syn region myhsString start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=hsSpecialChar
syn match myhsCharacter "[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=hsSpecialChar,hsSpecialCharError
syn match myhsCharacter "^'\([^\\]\|\\[^']\+\|\\'\)'" contains=hsSpecialChar,hsSpecialCharError
syn match myhsNumber "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match myhsFloat "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
syn match myhsConstructor "\<[A-Z][a-zA-Z0-9_]*\>'*\.\@!"
syn match myhsCons "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!:[\-!#$%&*+/<=>?@\\\^|~.:]\@!"
syn match myhsUnit "()"
syn match myhsListDelim "\[\|\]"
syn match myhsComma ","
syn match myhsBadComma ",\%(\_s*[\])}]\)\@="
syn match myhsBadNonComma "[a-zA-Z0-9_')]\@<=\s\s*[a-zA-Z0-9_'(]\@=" contained
syn cluster myhsConstants contains=myhsString,myhsCharacter,myhsNumber,myhsFloat,myhsConstructor,myhsCons,myhsUnit,myhsListDelim,myhsComma,myhsBadComma
hi def link myhsSpecialChar Special
hi def link myhsSpecialCharError Error
hi def link myhsString myhsConstant
hi def link myhsCharacter myhsConstant
hi def link myhsNumber myhsConstant
hi def link myhsFloat myhsConstant
hi def link myhsConstructor myhsConstant
hi def link myhsCons myhsConstant
hi def link myhsUnit myhsConstant
hi def link myhsListDelim myhsConstant
hi def link myhsTupleDelim myhsConstant
hi def link myhsComma myhsConstant
hi def link myhsConstant Constant
hi def link myhsBadComma Error
hi def link myhsBadNonComma Error

 " Misc statement stuff
syn keyword myhsStatement do mdo rec proc case of let in where
syn keyword myhsConditional if then else
syn match myhsStatementOp "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!\%(=\|<-\||\|@\|\.\.\)[\-!#$%&*+/<=>?@\\\^|~.:]\@!"
syn match myhsArrow "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!->[\-!#$%&*+/<=>?@\\\^|~.:]\@!"
syn match myhsLambda "\\" contained
syn cluster myhsStatements contains=myhsStatement,myhsConditional,myhsStatementOp,myhsArrow,myhsLambda
hi def link myhsStatement Statement
hi def link myhsConditional Conditional
hi def link myhsStatementOp Statment
hi def link myhsArrow myhsStatementOp
hi def link myhsLambda myhsStatementOp

 " Normal expressions
syn region myhsParensN start="(" end=")" contains=@myhsExprs
syn region myhsTupleN matchgroup=myhsTupleDelim start="(\%(\%(\_[^(),]\|(\%(\_[^()]\|(\_[^()]*)\)*)\)*,\)\@=" end=")" contains=@myhsExprs
syn region myhsRecordN start="{" end="}" contains=@myhsExprs
syn cluster myhsExprs contains=myhsParensN,myhsTupleN,myhsRecordN,@myhsComments,@myhsConstants,@myhsStatements

 " Pattern expressions
syn match myhsBinding "\<[a-z][a-zA-Z0-9_]*\>'*\|:\@<![\-!#$%&*+/<=>?@\\\^|~]\+" contained
syn match myhsBindingR "\<[a-z][a-zA-Z0-9_]*\>'*\(\s*=\)\@!" contained
syn region myhsParensP start="(" end=")" contained contains=@myhsPatterns
syn region myhsTupleP matchgroup=myhsTupleDelim start="(\%(\%(\_[^(),]\|(\%(\_[^()]\|(\_[^()]*)\)*)\)*,\)\@=" end=")" contained contains=@myhsPatterns
syn region myhsRecordP start="{" end="}" contained contains=@myhsPatternsR
syn cluster myhsPatterns contains=myhsParensP,myhsTupleP,myhsBinding,@myhsComments,@myhsConstants,@myhsStatements
syn cluster myhsPatternsR contains=myhsParensP,myhsTupleP,myhsBindingR,@myhsComments,@myhsConstants,@myhsStatements
syn match myhsPattern "\%(^\|\\\|\%(\<where\>\|\<let\>\)\@<=\)\%([^\\-]\|--\@!\)\{-}\ze[\-!#$%&*+/<=>?@\\\^|~.]\@<!\%(|\|=\|<-\|->\)[\-!#$%&*+/<=>?@\\\^|~.]\@!" transparent contains=@myhsPatterns
hi def link myhsBindingR myhsBinding
hi def link myhsBinding Identifier

 " Type expressions
syn match myhsContext "=>" contained
syn keyword myhsForall forall contained
syn match myhsTypeVar "\<[a-z][a-zA-Z0-9_]*\>'*" contained
syn region myhsParensT start="(" end=")" contained contains=@myhsTypes
syn region myhsListT start="\[" end="]" contained contains=@myhsTypes
syn cluster myhsTypes contains=myhsContext,myhsForall,myhsTypeVar,myhsParensT,myhsListT,@myhsComments,myhsStatementOp
syn region myhsTypeExpr start="" end="\%(\n\%(\s*\(=>\|->\)\)\@!\|\]\|)\|}\|\<of\>\)\@=" contained contains=@myhsTypes
syn match myhsDC "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!::[\-!#$%&*+/<=>?@\\\^|~.:]\@!" nextgroup=myhsTypeExpr
syn region myhsTypeAnnotation start="^\z(\s*\)\%([a-z][a-zA-Z0-9_]*\>'*\|([\-!#$%&*+/<=>?@\\\^|~]*)\)\s*\ze::" skip="\n\z1\s\s*\S" end="$" transparent contains=myhsBinding,myhsDC
hi def link myhsContext myhsStatementOp
hi def link myhsTypeVar myhsBinding
hi def link myhsTypeBinding myhsBinding
hi def link myhsDC myhsStatementOp

 " Data declarations (Assumed to start on new line always)
syn keyword myhsDataAux deriving contained
syn keyword myhsDataKeyword data newtype contained
syn region myhsDataDecl start="^\z(\s*\)\<data\>\|\<newtype\>" skip="\n\z1\s\s*\S" end="\n\@=" transparent contains=myhsDataLeft,myhsDataRight,myhsDataAux,@myhsComments
syn match myhsTypeBinding "\<[A-Z][a-zA-Z0-9_]*\>'*" contained
syn region myhsDataLeft start="\<data\>\|\<newtype\>" end="\%(=\|$\)\@=" transparent contained contains=myhsTypeBinding,myhsTypes,@myhsComments
syn match myhsDataRight "[=|]\s*[A-Z][a-zA-Z0-9_]*\>'*" transparent contained contains=myhsTypeBinding,myhsStatementOp,hsLineComment,hsBlockComment
hi def link myhsDataAux StorageClass

 " Type aliases
syn keyword myhsTypeKeyword type contained
syn region myhsTypeAlias start="\<type\>" end="=\@=" transparent contains=myhsTypeKeyword,myhsTypeBinding,myhsTypeVar nextgroup=myhsTypeExpr

 " Class declarations
syn keyword myhsClassKeyword class where contained
syn region myhsClassDecl start="^\z(\s*\)\<class\>" skip="\n\z1\s\s*\S" end="\n\@=" transparent
syn region myhsClassLeft start="\<class\>" end="\%(\<where\>\)\@=" transparent contained contains=myhsTypeBinding,myhsTypeVar,myhsContext,myhsClassKeyword,@myhsComments

 " Instance declarations
syn keyword myhsInstanceKeyword instance where contained
syn region myhsInstanceDecl start="^\z(\s*\)\<instance\>" skip="\n\z1\s\s*\S" end="\n\@=" transparent

 " Other special declarations
syn keyword myhsModuleKeyword module where contained
syn match myhsModuleExportDP "\.\." contained
syn region myhsModuleExport start="(" skip="([^()]*)" end=")" keepend contained contains=myhsBinding,myhsModuleExportDP,myhsBadComma,myhsBadNonComma,@myhsComments
syn region myhsModuleDecl start="\<module\>" end="\<where\>" keepend transparent contains=myhsModuleKeyword,myhsModuleExport,@myhsComments
syn keyword myhsImportKeyword import as qualified hiding contained
syn region myhsImportDecl start="\<import\>" excludenl end="$" contains=myhsImportKeyword,@myhsComments
syn keyword myhsInfixKeyword infix infixl infixr
syn match myhsInfixDecl "\<infix[lr]\?\>\s*[0-9]\+\s*[\-!#$%&*+/<=>?@\\\^|~.]*" transparent contains=myhsInfixDeclBinding,myhsInfixKeyword,myhsNumber
syn match myhsInfixDeclBinding "[\-!#$%&*+/<=>?@\\\^|~.]" contained
hi def link myhsModuleKeyword PreProc
hi def link myhsImportKeyword PreProc
hi def link myhsInfixKeyword PreProc

let b:current_syntax = "myhs2"

