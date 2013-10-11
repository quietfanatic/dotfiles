
" Remove any old syntax stuff hanging around
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syn match myhsBindingRegion "\%(^\|\\\|\%(\<where\>\|\<let\>\)\@<=\)\%([^\\-]\|--\@!\)\{-}\ze[\-!#$%&*+/<=>?@\\\^|~.]\@<!\%(|\|=\|<-\|->\)[\-!#$%&*+/<=>?@\\\^|~.]\@!" transparent contains=myhsBinding,myhsStatement,myhsStatementOp,myhsConditional,myhsComma,myhsBadComma,hsString,hsCharacter,hsNumber,hsFloat,myhsLambda,hsLineComment,hsBlockComment,myhsArrow,myhsConstructor,myhsListDelim,myhsCons,myhsUnit
syn match myhsBinding "\<[a-z][a-zA-Z0-9_]*\>'*\|:\@<![\-!#$%&*+/<=>?@\\\^|~]*" contained contains=NONE
syn match myhsTypeBinding "\<[A-Z][a-zA-Z0-9_]*\>'*" contained contains=NONE
syn match myhsTypeVar "\<[a-z][a-zA-Z0-9_]*\>'*" contained

syn match myhsTypeConstraint "^\s*\%([a-z][a-zA-Z0-9_]*\>'*\|([\-!#$%&*+/<=>?@\\\^|~]*)\)\s*\ze::" transparent contains=myhsBinding
syn region myhsTypeExpr start="[\-!#$%&*+/<=>?@\\\^|~.:]\@<!::[\-!#$%&*+/<=>?@\\\^|~.:]\@!" end="\ze\%(\n\%(\s*\(=>\|->\)\)\@!\|\])\|\<of\>\)" contains=myhsParensT,myhsListT,myhsDC,myhsTypeVar,myhsContext,hsLineComment,hsBlockComment
syn region myhsParensT start="(" end=")" contained contains=myhsParensT,myhsListT,myhsTypeVar,hsLineComment,hsBlockComment
syn region myhsListT start="\[" end="\]" contained contains=myhsParensT,myhsListT,myhsTypeVar,hsLineComment,hsBlockComment

syn match myhsConstructor "\<[A-Z][a-zA-Z0-9_]*\>'*\.\@!"
syn match myhsCons "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!:[\-!#$%&*+/<=>?@\\\^|~.:]\@!"

syn keyword myhsStatement do mdo rec proc case of let in where
syn match myhsStatementOp "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!\%(=\|<-\||\|@\|\.\.\)[\-!#$%&*+/<=>?@\\\^|~.:]\@!"
syn match myhsArrow "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!->[\-!#$%&*+/<=>?@\\\^|~.:]\@!"
syn match myhsLambda "\\" contained
"syn match myhsComma ","
syn match myhsBadComma ",\%(\_s*[\])}]\)\@="
syn match myhsUnit "()"
syn match myhsContext "=>"
syn match myhsDC "[\-!#$%&*+/<=>?@\\\^|~.:]\@<!::[\-!#$%&*+/<=>?@\\\^|~.:]\@!" contained
syn match myhsListDelim "\[\|\]"
syn keyword myhsConditional if then else

syn match myhsRecord "{\_[^};]*}" transparent contains=TOP,myhsBindingRegion

syn region myhsClassDecl start="\<class\>\zs" end="\%(\<where\>\)\@<=" transparent contains=myhsTypeBinding,myhsTypeVar,myhsLineComment,myhsBlockComment,myhsContext,myhsStatement

syn region myhsTypeDecl start="\<data\>\|\<newtype\>" skip="\n\s\s*\S" end="\n" transparent contains=myhsTypeBindingLeft,myhsTypeBindingRight,myhsTypeFieldBinding,myhsBindingRegion,myhsTypeConstraint,hsString,hsCharacter,hsNumber,hsFloat,hsLineComment,hsBlockComment
syn match myhsTypeBindingLeft "\%(\<data\>\|\<newtype\>\)\s*[^=]*\ze\%(=\|$\)" transparent contained contains=myhsTypeBinding,myhsStatementOp,myhsTypeKeyword,myhsTypeVar,hsLineComment,hsBlockComment
syn match myhsTypeBindingRight "[=|]\s*[A-Z][a-zA-Z0-9_]*\>'*" transparent contained contains=myhsTypeBinding,myhsStatementOp,hsLineComment,hsBlockComment
syn keyword myhsTypeKeyword data newtype class type contained
syn match myhsTypeFieldPart "\%(\<[a-zA-Z][a-zA-Z0-9_]*\>'*\s*\ze::\)" transparent contained contains=myhsBinding,myhsStatementOp,hsLineComment,hsBlockComment

syn region myhsTypeAlias start="\<type\>" end="\ze=" transparent contains=myhsTypeKeyword,myhsTypeBinding,myhsTypeVar nextgroup=myhsTypeAliasRight
syn region myhsTypeAliasRight start="=" end="\ze\%(\n\%(\s*\%(=>\|->\)\)\@!\)" transparent contained contains=myhsStatementOp,myhsContext

syn region myhsInstanceRegion start="\<instance\>" end="\<where\>" keepend transparent contains=myhsTypeVar,myhsStatement,myhsContext,hsLineComment,hsBlockComment
syn keyword myhsInstance instance contained

syn match myhsInfixDecl "\<infix[lr]\?\>\s*[0-9]\+\s*[\-!#$%&*+/<=>?@\\\^|~.]*" transparent contains=myhsInfixDeclBinding,hsNumber
syn match myhsInfixDeclBinding "[\-!#$%&*+/<=>?@\\\^|~.]" contained

syn region myhsModuleDef start="\<module\>" end="\<where\>" keepend transparent contains=myhsModule,myhsStatement,hsLineComment,hsBlockComment
syn keyword myhsModule module contained

" Strings and constants
syn match   hsSpecialChar	contained "\\\([0-9]\+\|o[0-7]\+\|x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|^[A-Z^_\[\\\]]\)"
syn match   hsSpecialChar	contained "\\\(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|RS\|US\|SP\|DEL\)"
syn match   hsSpecialCharError	contained "\\&\|'''\+"
syn region  hsString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=hsSpecialChar
syn match   hsCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=hsSpecialChar,hsSpecialCharError
syn match   hsCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=hsSpecialChar,hsSpecialCharError
syn match   hsNumber		"\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
syn match   hsFloat		"\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"

" Keyword definitions. These must be patters instead of keywords
" because otherwise they would match as keywords at the start of a
" "literate" comment (see lhs.vim).
syn match hsImport		"\<import\>.*"he=s+6 contains=hsImportMod,hsLineComment,hsBlockComment
syn match hsImportMod		contained "\<\(as\|qualified\|hiding\)\>"
"syn match hsInfix		"\<\(infix\|infixl\|infixr\)\>"

" Not real keywords, but close.
if exists("hs_highlight_boolean")
  " Boolean constants from the standard prelude.
  syn match hsBoolean "\<\(True\|False\)\>"
endif
if exists("hs_highlight_types")
  " Primitive types from the standard prelude and libraries.
  syn match hsType "\<\(Int\|Integer\|Char\|Bool\|Float\|Double\|IO\|Void\|Addr\|Array\|String\)\>"
endif
if exists("hs_highlight_more_types")
  " Types from the standard prelude libraries.
  syn match hsType "\<\(Maybe\|Either\|Ratio\|Complex\|Ordering\|IOError\|IOResult\|ExitCode\)\>"
  syn match hsMaybe    "\<Nothing\>"
  syn match hsExitCode "\<\(ExitSuccess\)\>"
  syn match hsOrdering "\<\(GT\|LT\|EQ\)\>"
endif
if exists("hs_highlight_debug")
  " Debugging functions from the standard prelude.
  syn match hsDebug "\<\(undefined\|error\|trace\)\>"
endif


" Comments
syn match   hsLineComment      "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn region  hsBlockComment     start="{-"  end="-}" contains=hsBlockComment
syn region  hsPragma	       start="{-#" end="#-}"

" C Preprocessor directives. Shamelessly ripped from c.vim and trimmed
" First, see whether to flag directive-like lines or not
if (!exists("hs_allow_hash_operator"))
    syn match	cError		display "^\s*\(%:\|#\).*$"
endif
" Accept %: for # (C99)
syn region	cPreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1 contains=cComment,cCppString,cCommentError
syn match	cPreCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"
syn region	cCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=cCppOut2
syn region	cCppOut2	contained start="0" end="^\s*\(%:\|#\)\s*\(endif\>\|else\>\|elif\>\)" contains=cCppSkip
syn region	cCppSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=cCppSkip
syn region	cIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	cIncluded	display contained "<[^>]*>"
syn match	cInclude	display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=cIncluded
syn cluster	cPreProcGroup	contains=cPreCondit,cIncluded,cInclude,cDefine,cCppOut,cCppOut2,cCppSkip,cCommentStartError
syn region	cDefine		matchgroup=cPreCondit start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$"
syn region	cPreProc	matchgroup=cPreCondit start="^\s*\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend

syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=cCommentStartError,cSpaceError contained
syntax match	cCommentError	display "\*/" contained
syntax match	cCommentStartError display "/\*"me=e-1 contained
syn region	cCppString	start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial contained

syn match myhstitle "------*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?-----$"


hi def link myhsBinding Identifier
hi def link myhsTypeConstraint Identifier
hi def link myhsTypeBinding Identifier
hi def link myhsInfixDeclBinding Identifier
hi def link myhsTypeVar Identifier
hi def link myhsStatement Statement
hi def link myhsStatementOp Statement
hi def link myhsLambda Statement
hi def link myhsArrow Statement
hi def link myhsDC Statement
hi def link myhsContext Statement
hi def link myhsConditional Conditional
hi def link myhsConstructor Constant
hi def link myhsComma Constant
hi def link myhsBadComma Error
hi def link myhsUnit Constant
hi def link myhsListDelim Constant
hi def link myhsCons Constant
hi def link myhsTitle Title

hi def link hsImport			  Include
hi def link hsImportMod			  hsImport
hi def link hsInfix			  PreProc
hi def link hsStructure			  Structure
hi def link hsStatement			  Statement
hi def link hsConditional			  Conditional
hi def link hsSpecialChar			  SpecialChar
hi def link hsTypedef			  Typedef
hi def link hsVarSym			  hsOperator
hi def link hsConSym			  hsOperator
hi def link hsOperator			  Operator
if exists("hs_highlight_delimiters")
  " Some people find this highlighting distracting.
  hi def link hsDelimiter			  Delimiter
endif
hi def link hsSpecialCharError		  Error
hi def link hsString			  String
hi def link hsCharacter			  Character
hi def link hsNumber			  Number
hi def link hsFloat			  Float
hi def link hsConditional			  Conditional
hi def link hsLiterateComment		  hsComment
hi def link hsBlockComment		  hsComment
hi def link hsLineComment			  hsComment
hi def link hsComment			  Comment
hi def link hsPragma			  SpecialComment
hi def link hsBoolean			  Boolean
hi def link hsType			  Type
hi def link hsMaybe			  hsEnumConst
hi def link hsOrdering			  hsEnumConst
hi def link hsEnumConst			  Constant
hi def link hsDebug			  Debug

hi def link cCppString		hsString
hi def link cCommentStart		hsComment
hi def link cCommentError		hsError
hi def link cCommentStartError	hsError
hi def link cInclude		Include
hi def link cPreProc		PreProc
hi def link cDefine		Macro
hi def link cIncluded		hsString
hi def link cError			Error
hi def link cPreCondit		PreCondit
hi def link cComment		Comment
hi def link cCppSkip		cCppOut
hi def link cCppOut2		cCppOut
hi def link cCppOut		Comment

let b:current_syntax = "haskell"

" Options for vi: ts=8 sw=2 sts=2 nowrap noexpandtab ft=vim
