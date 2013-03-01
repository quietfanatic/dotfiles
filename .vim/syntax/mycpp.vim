
" This is a syntax file by me.
" All things with names starting with mycpp are public domain
" The things beginning with c are almost all (if not all) copied from the c syntax file provided with vim.  See http://vimdoc.sourceforge.net/htmldoc/uganda.html#license for the license.  If anybody has a problem with my copying this, please contact me.

syn match mycppBinding "\%([0-9a-zA-Z_(]\|\%(>\@<! \|[->]\)\@<!>\+\|::\|\.\.\.\|}\@<=\)[*&]*\s\s*\%(\h\w*::\)*\%(operator\s*\zs\S\S*\ze\|\zs\h\w*\ze\)\s*\%([{([=;,>)]\|::\@!\)" contains=mycppMiscReserved
"syn match mycppBindingOperator "\%([0-9a-zA-Z_>][*&]*\s\s*\)operator\>\s*\zs\S\S*\ze\s\s*("
 " Function pointers are magically handled by mycppBinding now.
"syn match mycppBindingFP "\%([0-9a-zA-Z_>][*&]*\s*\)([*&][*&]*\s\s*\zs\h\w*\%(::\h\w*\)*\ze\s\s*)\s*[([]"
syn match mycppBindingType "\%(namespace\|struct\|union\|class\|enum\|enum\s\s*class\)\s\s*\zs\h\w*\ze\s*\%([{;]\|::\@!\)"
syn region mycppEnum1 start="\zs\<enum\>[^{;]*{" end=";" transparent contains=mycppBindingType,mycppBinding,mycppEnum2
syn region mycppEnum2 start="{" end="}" transparent contained contains=mycppBindingEnum
syn match mycppBindingEnum contained "\%([{,][\n 	]*\)\@<=\zs\h\w*\ze\_s*[=,}]"
syn match mycppBindingCF "\<CF(\s*\zs\h\w*\%(::\h\w*\)*\%(operator\)\@<!\s"
syn match mycppBindingCFOperator "\<CF(\s*operator\>\s*\zs\S\S*\ze"
"syn region mycppFold0 start="^\S.*{$" end="^}" transparent fold
"syn region mycppFold1 start="^    \S.*{$" end="^    }" transparent fold
"syn region mycppFold2 start="^        \S.*{$" end="^        }" transparent fold
"syn region mycppFold3 start="^            \S.*{$" end="^            }" transparent fold
"syn region mycppFunc start=")\s*{\zs" end="}" contains=mycppBlock,cStatement,cLabel,cConditional,cRepeat,cppStatement,cppOperator,cString,cCharacter,cNumbers,cOperator,cPreProcGroup,cComment,cCommentL transparent
"syn region mycppBlock start="{" end="}" contained contains=mycppBlock,cStatement,cLabel,cConditional,cRepeat,cppStatement,cppOperator,cString,cCharacter,cNumbers,cOperator,cPreProcGroup,cComment,cCommentL transparent
"syn region mycppParens start="(\%(\s*[*&]\)\@!" end=")" contains=mycppParens,cStatement,cLabel,cConditional,cRepeat,cppStatement,cppOperator,cString,cCharacter,cNumbers,cOperator,cPreProcGroup,cComment,cCommentL

syn keyword mycppConstant null nullptr
syn match mycppMiscConstant "\<[A-Z_][0-9A-Z_][0-9A-Z_]*\%(\<CF\>\)\@<!\>"
syn match mycppControlOperator "\s\@<=\%(?\|&&\|||\)\s\@="
syn keyword mycppControlOp and or
syn keyword mycppOperator bitor xor compl bitand and_eq or_eq xor_eq not not_eq
syn keyword mycppStatement goto break return continue asm
syn keyword mycppException throw try catch
syn keyword mycppConditional if else switch
syn keyword mycppRepeat while for do
syn keyword mycppAlloc new delete
syn keyword mycppAllocFunction malloc realloc calloc free
syn keyword mycppLabel case default
syn match mycppUserLabel "[;{]\_s*\zs\h\w*\ze:\_s"

syn keyword mycppStorageEtc constexpr explicit extern friend inline mutable override private protected public register static template typedef virtual volatile
syn keyword mycppMiscReserved contained auto bool char class const const_cast decltype default delete double dynamic_cast enum float int long reinterpret_cast short signed sizeof static_cast struct this typeid typename typeof union unsigned using void wchar_t

syn match cFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn region cString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=cFormat,@Spell

syn match cCharacter "L\='[^\\]'"
syn match cCharacter "L'[^']*'"

syn case ignore
syn match cNumbers display transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctalError,cOctal
syn match cNumber display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match cNumber display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match cOctal display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cOctalZero
syn match cOctalZero display contained "\<0"
syn match cOctalError display contained "0\o*[89]\d*"
syn match	cFloat		display contained "\d\+f"
syn match	cFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
syn match	cFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
syn match	cFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn case match

syn region	cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell extend
syntax match	cCommentError	display "\*/"
syntax match	cCommentStartError display "/\*"me=e-1 contained
"syn keyword	cOperator	sizeof
syn keyword	cStatement	__asm__
"syn keyword	cOperator	typeof __real__ __imag__

" Accept %: for # (C99)
syn region	cPreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=cComment,cCommentL,cCppString,cCharacter,cCppParen,cParenError,cNumbers,cCommentError,cSpaceError
syn match	cPreConditMatch	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"
if !exists("c_no_if0")
  syn cluster	cCppOutInGroup	contains=cCppInIf,cCppInElse,cCppInElse2,cCppOutIf,cCppOutIf2,cCppOutElse,cCppInSkip,cCppOutSkip
  syn region	cCppOutWrapper	start="^\s*\(%:\|#\)\s*if\s\+0\+\s*\($\|//\|/\*\|&\)" end=".\@=\|$" contains=cCppOutIf,cCppOutElse fold
  syn region	cCppOutIf	contained start="0\+" matchgroup=cCppOutWrapper end="^\s*\(%:\|#\)\s*endif\>" contains=cCppOutIf2,cCppOutElse
  if !exists("c_no_if0_fold")
    syn region	cCppOutIf2	contained matchgroup=cCppOutWrapper start="0\+" end="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0\+\s*\($\|//\|/\*\|&\)\)\@!\|endif\>\)"me=s-1 contains=cSpaceError,cCppOutSkip fold
  else
    syn region	cCppOutIf2	contained matchgroup=cCppOutWrapper start="0\+" end="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0\+\s*\($\|//\|/\*\|&\)\)\@!\|endif\>\)"me=s-1 contains=cSpaceError,cCppOutSkip
  endif
  syn region	cCppOutElse	contained matchgroup=cCppOutWrapper start="^\s*\(%:\|#\)\s*\(else\|elif\)" end="^\s*\(%:\|#\)\s*endif\>"me=s-1 contains=TOP,cPreCondit
  syn region	cCppInWrapper	start="^\s*\(%:\|#\)\s*if\s\+0*[1-9]\d*\s*\($\|//\|/\*\||\)" end=".\@=\|$" contains=cCppInIf,cCppInElse fold
  syn region	cCppInIf	contained matchgroup=cCppInWrapper start="\d\+" end="^\s*\(%:\|#\)\s*endif\>" contains=TOP,cPreCondit
  if !exists("c_no_if0_fold")
    syn region	cCppInElse	contained start="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0*[1-9]\d*\s*\($\|//\|/\*\||\)\)\@!\)" end=".\@=\|$" containedin=cCppInIf contains=cCppInElse2 fold
  else
    syn region	cCppInElse	contained start="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0*[1-9]\d*\s*\($\|//\|/\*\||\)\)\@!\)" end=".\@=\|$" containedin=cCppInIf contains=cCppInElse2
  endif
  syn region	cCppInElse2	contained matchgroup=cCppInWrapper start="^\s*\(%:\|#\)\s*\(else\|elif\)\([^/]\|/[^/*]\)*" end="^\s*\(%:\|#\)\s*endif\>"me=s-1 contains=cSpaceError,cCppOutSkip
  syn region	cCppOutSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=cSpaceError,cCppOutSkip
  syn region	cCppInSkip	contained matchgroup=cCppInWrapper start="^\s*\(%:\|#\)\s*\(if\s\+\(\d\+\s*\($\|//\|/\*\||\|&\)\)\@!\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" containedin=cCppOutElse,cCppInIf,cCppInSkip contains=TOP,cPreProc
endif
syn region	cIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	cIncluded	display contained "<[^>]*>"
syn match	cInclude	display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=cIncluded
"syn match cLineSkip	"\\$"
syn cluster	cPreProcGroup	contains=cPreCondit,cIncluded,cInclude,cDefine,cErrInParen,cErrInBracket,cUserLabel,cSpecial,cOctalZero,cCppOutWrapper,cCppInWrapper,@cCppOutInGroup,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom,cString,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cParen,cBracket,cMulti
syn region	cDefine		start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell,mycppBindingEnum,mycppEnum2
syn region	cPreProc	start="^\s*\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell


syn keyword cConstant __func__ L_tmpnam
syn keyword cConstant true false


hi def link mycppBinding Binding
"hi def link mycppBindingOperator Binding
"hi def link mycppBindingFP Binding
hi def link mycppBindingType Binding
hi def link mycppBindingEnum Binding
hi def link mycppBindingCF Binding
hi def link mycppBindingCFOperator Binding
hi def link mycppConstant Constant
hi def link mycppMiscConstant Constant
hi def link mycppOperator Operator
hi def link mycppLabel Label
hi def link mycppUserLabel Label
hi def link mycppStatement Statement
hi def link mycppConditional Conditional
hi def link mycppException Exception
hi def link mycppRepeat Repeat
hi def link mycppControlOperator Statement
hi def link mycppControlOp Statement
hi def link mycppAlloc Keyword
hi def link mycppAllocFunction Keyword
hi def link mycppStorageEtc StorageClass
hi def link Binding Identifier

hi def link cFormat		cSpecial
hi def link cCppString		cString
hi def link cCommentL		cComment
hi def link cCommentStart	cComment
hi def link cCharacter		Character
hi def link cSpecialCharacter	cSpecial
hi def link cNumber		Number
hi def link cOctal		Number
hi def link cOctalZero		PreProc	 " link this to Error if you want
hi def link cFloat		Float
hi def link cOctalError		cError
hi def link cParenError		cError
hi def link cErrInParen		cError
hi def link cErrInBracket	cError
hi def link cCommentError	cError
hi def link cCommentStartError	cError
hi def link cSpaceError		cError
hi def link cSpecialError	cError
hi def link cCurlyError		cError
hi def link cOperator		Operator
hi def link cStructure		Structure
hi def link cStorageClass	StorageClass
hi def link cInclude		Include
hi def link cPreProc		PreProc
hi def link cDefine		Macro
hi def link cIncluded		cString
hi def link cError		Error
hi def link cStatement		Statement
hi def link cCppInWrapper	cCppOutWrapper
hi def link cCppOutWrapper	cPreCondit
hi def link cPreConditMatch	cPreCondit
hi def link cPreCondit		PreCondit
hi def link cType		Type
hi def link cConstant		Constant
hi def link cCommentString	cString
hi def link cComment2String	cString
hi def link cCommentSkip	cComment
hi def link cString		String
hi def link cComment		Comment
hi def link cSpecial		SpecialChar
hi def link cTodo		Todo
hi def link cBadContinuation	Error
hi def link cCppOutSkip		cCppOutIf2
hi def link cCppInElse2		cCppOutIf2
hi def link cCppOutIf2		cCppOut2  " Old syntax group for #if 0 body
hi def link cCppOut2		cCppOut  " Old syntax group for #if of #if 0
hi def link cCppOut		Comment

let b:current_syntax = "mycpp"






