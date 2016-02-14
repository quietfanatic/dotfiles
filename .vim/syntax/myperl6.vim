
syn keyword myperl6Decl class grammar role module package nextgroup=myperl6Binding
syn match myperl6Binding "\_s*\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*" contained
syn keyword myperl6Scope my our constant has state temp let nextgroup=myperl6ScopeSpace
syn match myperl6ScopeSpace "\_s*" contained nextgroup=myperl6Decl,myperl6Sub,myperl6Enum,myperl6Regex,myperl6VarType,myperl6VarBinding,myperl6VarSigilless
syn match myperl6VarType "\_s*\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*" contained nextgroup=myperl6VarBinding,myperl6VarSigilless
syn match myperl6VarBinding "\_s*[$@%&][.!*]\?\h\%(\w\|-\a\|'\a\)*" contained nextgroup=myperl6VarComma
syn match myperl6VarSigilless "\_s*\\" contained nextgroup=myperl6VarSigillessBinding
syn match myperl6VarSigillessBinding "\h\%(\w\|-\a\|'\a\)*" contained nextgroup=myperl6VarComma
syn match myperl6VarComma "\_s*,\_s*" contained nextgroup=myperl6VarType,myperl6VarBinding,myperl6VarSigilless

syn keyword myperl6Sub sub method submethod nextgroup=myperl6SubName
syn match myperl6SubName "\_s*\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*\_s*" contained nextgroup=myperl6SubSignature
syn region myperl6SubSignature matchgroup=myperl6SubSignature start="(" end=")" contained contains=TOP
syn region myperl6SubSignatureDefault start='=' end='[,;)]\|-->' contained containedin=myperl6SubSignature contains=TOP
syn match myperl6SubParameter "\_s*[$@%&][.!*]\?\h\%(\w\|-\a\|'\a\)*" contained containedin=myperl6SubSignature
syn match myperl6SubSigilless "\_s*\\" contained nextgroup=myperl6VarSigillessBinding containedin=myperl6Subsignature
syn match myperl6SubSigillessBinding "\h\%(\w\|-\a\|'\a\)*" contained
syn region myperl6Parens matchgroup=myperl6Parens start="(" end=")" contained containedin=myperl6SubSignature contains=TOP

syn keyword myperl6Enum enum nextgroup=myperl6EnumName
syn match myperl6EnumName "\_s*\h\%(\w\|-\a\|'\a\)*\_s*" contained nextgroup=myperl6EnumBlock
syn region myperl6EnumBlock matchgroup=myperl6Nothing start="{" end="}" contained contains=TOP
syn match myperl6EnumBinding "\%([{,]\_s*\)\@<=\h\%(\w\|-\a\|'\a\)*\|\h\%(\w\|-\a\|'\a\)*\%(\_s*[=,}]\)\@=" contained containedin=myperl6EnumBlock

syn keyword myperl6Regex regex rule token nextgroup=myperl6RegexBinding
syn match myperl6RegexBinding "\_s*\h\%(\w\|-\a\|'\a\)*\_s*" contained nextgroup=myperl6RegexBlock
syn region myperl6RegexBlock matchgroup=myperl6RegexBlock start="{" end="}" contained contains=@myperl6InRegex
syn cluster myperl6InRegex contains=@myperl6Comment,myperl6RegexChar,myperl6RegexThing,myperl6StringQQ,myperl6StringQ,@myperl6Interp,myperl6RegexEscape,myperl6RegexNamedBinding,myperl6RegexThingArgs
syn match myperl6RegexChar "\w*" contained
syn region myperl6RegexThing start="<" end=">" contained

syn match myperl6RegexNamedBinding "$<\%([^>\\]\|\\\\\|\\>\)*>\%(\s_*=\)\@=" contained

syn region myperl6RegexThingArgs matchgroup=myperl6RegexThingArgs start="<\_s*\h\w*\_s*:" end=">" contained contains=TOP

syn region myperl6LineComment start="#" end="\n" keepend
syn region myperl6Pod start="^=begin\>" end="^=end\>"
 " There's a lot of these.  We'll only recognize ascii brackets.
syn region myperl6BlockCommentP start="#`(" end=")"
syn region myperl6BlockCommentA start="#`<" end=">"
syn region myperl6BlockCommentS start="#`\[" end="\]"
syn region myperl6BlockCommentC start="#`{" end="}"
 " And because there's an example of this in S02
syn region myperl6BlockCommentCC start="#`{{" end="}}"
syn cluster myperl6Comment contains=myperl6LineComment,myperl6Pod,myperl6BlockCommentP,myperl6BlockCommentP,myperl6BlockCommentA,myperl6BlockCommentS,myperl6BlockCommentC,myperl6BlockCommentCC,myperl6Title

syn region myperl6Title start="#####" end="\n" keepend

 " This might not cover everything, but whatever
syn match myperl6Number "$\@<!\<\d\%(\w\|\.\)*"
 " Don't really need this but whatever
syn match myperl6Version "v\%(\*\|\d\+\)+\?\%(\.\%(\*\|\d+\)+\?\)*"

syn region myperl6StringQQ start='"' skip='\\\\\|\\"' end='"' contains=@myperl6Interp
syn region myperl6StringQ start="'" skip="\\\\\|\\'" end="'"
syn region myperl6QW start="$\@<!<" skip="\\\\\|\\>" end=">"

syn match myperl6InterpScalar "$[.^:*?=!~]\?\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*" contained nextgroup=@myperl6InterpSuffix
syn match myperl6InterpArray "@[.^:*?=!~]\?\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*\[\@=" contained nextgroup=myperl6InterpArrayIndex
syn match myperl6InterpHash "%[.^:*?=!~]\?\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*[{<]\@=" contained nextgroup=myperl6InterpHashIndexA,myperl6InterpHashIndexC
syn match myperl6InterpSub "&[.^:*?=!~]\?\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*(\@=" contained nextgroup=myperl6InterpCall
syn region myperl6InterpBlock matchgroup=myperl6ControlOp start="{" end="}" contained contains=TOP
syn cluster myperl6Interp contains=myperl6InterpScalar,myperl6InterpArray,myperl6InterpHash,myperl6InterpSub,myperl6InterpBlock

syn region myperl6InterpArrayIndex start="\[" end="\]" contained contains=TOP nextgroup=myperl6InterpSuffix
syn region myperl6InterpHashIndexA start="<" end=">" contained nextgroup=myperl6InterpSuffix
syn region myperl6InterpHashIndexC matchgroup=myperl6InterpHashIndexC start="{" end="}" contained contains=TOP nextgroup=myperl6InterpSuffix
syn region myperl6InterpCall start="(" end=")" contained contains=TOP nextgroup=myperl6InterpSuffix
syn match myperl6InterpMethod "\.\h\%(\w\|-\a\|'\a\)*(\@=" contained nextgroup=myperl6InterpCall
syn cluster myperl6InterpSuffix contains=myperl6InterpArrayIndex,myperl6InterpHashIndexA,myperl6InterpHashIndexC,myperl6InterpCal,myperl6InterpSub,myperl6InterpMethod

 " todo: make s take two sections
syn keyword myperl6Q Q q qq qw qqw qx qqx m s tr mm ss rx nextgroup=myperl6QAdverb,myperl6QTo,@myperl6GeneralQuote
syn match myperl6QAdverb ":!\?\h\%(\w\|-\a\|'\a\)*" nextgroup=myperl6QAdverb,myperl6To,@myperl6GeneralQuote contained
syn match myperl6QTo ":to" nextgroup=myperl6HeredocQ,myperl6HeredocA contained
syn region myperl6HeredocQ start="'\z(\%([^\\']\|\\\\\|\\'\)*\)'" end="^\s*\z1\s*" contained
syn region myperl6HeredocA start="<\z(\%([^\\>]\|\\\\\|\\>\)*\)>" end="^\s*\z1\s*" contained

 " todo: differentiate according to interpolation
syn region myperl6GeneralQuoteSl start="/" skip="\\\\\|\\/" end="/" contained
syn region myperl6GeneralQuoteQ start="'" skip="\\\\\|\\'" end="'" contained
syn region myperl6GeneralQuoteQQ start='"' skip='\\\\\|\\"' end='"' contained
syn region myperl6GeneralQuoteP start="(" skip="\\\\\|\\)" end=")" contained
syn region myperl6GeneralQuoteA start="<" skip="\\\\\|\\>" end=">" contained
syn region myperl6GeneralQuoteS start="\[" skip="\\\\\|\\\]" end="\]" contained
syn region myperl6GeneralQuoteC start="{" skip="\\\\\|\\\}" end="}" contained
syn cluster myperl6GeneralQuote contains=myperl6GeneralQuoteSl,myperl6GeneralQuoteQ,myperl6GeneralQuoteQQ,myperl6GeneralQuoteP,myperl6GeneralQuoteA,myperl6GeneralQuoteS,myperl6GeneralQuoteC

syn match myperl6AutoQuote "\h\%(\w\|-\a\|'\a\)*\%(\_s*=>\)\@="

syn keyword myperl6Use use require no

syn match myperl6RegexEscape "\\['\"a-zA-Z0-9]" contained

syn match myperl6ControlOp "||\|&&\|//\|??\|!!"
syn keyword myperl6Control if elsif unless while until for loop and or xor andthen orelse return fail die next last redo goto given when default 
syn match myperl6Else "\<else\>"
syn match myperl6ElseIf "\<else\_s\+if\>"

syn region myperl6Block matchgroup=myperl6Block start="{" end="}" contains=TOP

hi link myperl6Binding Identifier
hi link myperl6VarBinding Identifier
hi link myperl6VarSigillessBinding Identifier
hi link myperl6RegexBinding Identifier
hi link myperl6RegexNamedBinding Identifier
hi link myperl6EnumName Identifier
hi link myperl6EnumBinding Identifier
hi link myperl6SubName Identifier
hi link myperl6SubParameter Identifier
hi link myperl6SubSigillessBinding Identifier
hi link myperl6LineComment Comment
hi link myperl6Pod Comment
hi link myperl6BlockCommentP Comment
hi link myperl6BlockCommentA Comment
hi link myperl6BlockCommentS Comment
hi link myperl6BlockCommentC Comment
hi link myperl6BlockCommentCC Comment
hi link myperl6Title Title
hi link myperl6Number Constant
hi link myperl6Version Constant
hi link myperl6StringQ Constant
hi link myperl6StringQQ Constant
hi link myperl6QW Constant
hi link myperl6RegexChar Constant
hi link myperl6AutoQuote Constant
hi link myperl6HeredocQ Constant
hi link myperl6HeredocA Constant
hi link myperl6GeneralQuoteSl Constant
hi link myperl6GeneralQuoteQ Constant
hi link myperl6GeneralQuoteQQ Constant
hi link myperl6GeneralQuoteP Constant
hi link myperl6GeneralQuoteA Constant
hi link myperl6GeneralQuoteS Constant
hi link myperl6GeneralQuoteC Constant
hi link myperl6InterpScalar NONE
hi link myperl6InterpArray NONE
hi link myperl6InterpHash NONE
hi link myperl6InterpSub NONE
hi link myperl6InterpBlock NONE
hi link myperl6Use PreProc
hi link myperl6ControlOp Statement
hi link myperl6Control Statement
hi link myperl6Else Statement
hi link myperl6ElseIf Error
