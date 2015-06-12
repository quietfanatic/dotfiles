
syn keyword myperl6Decl sub class grammar role module package nextgroup=myperl6Binding
syn match myperl6Binding "\_s*\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*" contained
syn keyword myperl6VarDecl my our has state constant nextgroup=myperl6VarBinding
syn match myperl6VarBinding "\_s*\%(\\\zs\|\zs[$@%&]\)\h\%(\w\|-\a\|'\a\)*"

syn keyword myperl6Regex regex rule token nextgroup=myperl6RegexBinding
syn match myperl6RegexBinding "\_s*\h\%(\w\|-\a\|'\a\)*\_s*" contained nextgroup=myperl6RegexBlock
syn region myperl6RegexBlock matchgroup=myperl6Nothing start="{" end="}" contained contains=@myperl6InRegex
syn cluster myperl6InRegex contains=myperl6LineComment,myperl6Pod,@myperl6Comment,myperl6RegexChar,myperl6RegexThing,myperl6StringQQ,myperl6StringQ,@myperl6Interp,myperl6RegexStringEscape
syn match myperl6RegexChar "\w*" contained
syn region myperl6RegexThing start="<" end=">" contained

syn region myperl6LineComment start="#" end="\n" keepend
syn region myperl6Pod start="^=begin\>" end="^=end\>"
 " There's a lot of these.  We'll only recognize ascii brackets.
syn region myperl6BlockCommentP start="#`(" end=")"
syn region myperl6BlockCommentA start="#`<" end=">"
syn region myperl6BlockCommentS start="#`\[" end="\]"
syn region myperl6BlockCommentC start="#`{" end="}"
 " And because there's an example of this in S02
syn region myperl6BlockCommentCC start="#`{{" end="}}"
syn cluster myperl6Comment contains=myperl6LineComment,myperl6Pod,myperl6BlockCommentP,myperl6BlockCommentP,myperl6BlockCommentA,myperl6BlockCommentS,myperl6BlockCommentC,myperl6BlockCommentCC

syn region myperl6Title start="#####" end="\n" keepend

 " This might not cover everything, but whatever
syn match myperl6Number "$\@<!\d\%(\w\|\.\)"

syn region myperl6StringQQ start='"' skip='\\\\\|\\"' end='"' contains=@myperl6Interp
syn region myperl6StringQ start="'" skip="\\\\\|\\'" end="'"
syn region myperl6QW start="<" skip="\\>" end=">"

syn match myperl6InterpScalar "$\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*" contained nextgroup=@myperl6InterpSuffix
syn match myperl6InterpArray "@\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*\[\@=" contained nextgroup=myperl6InterpArrayIndex
syn match myperl6InterpHash "%\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*[{<]\@=" contained nextgroup=myperl6InterpHashIndexA,myperl6InterpHashIndexC
syn match myperl6InterpSub "%\h\%(\w\|-\a\|'\a\)*\%(::\h\%(\w\|-\a\|'\a\)*\)*(\@=" contained nextgroup=myperl6InterpCall
syn region myperl6InterpBlock start="{" end="}" contained contains=TOP
syn cluster myperl6Interp contains=myperl6InterpScalar,myperl6InterpArray,myperl6InterpHash,myperl6InterpSub,myperl6InterpBlock

syn region myperl6InterpArrayIndex start="\[" end="\]" contained contains=TOP nextgroup=myperl6InterpSuffix
syn region myperl6InterpHashIndexA start="<" end=">" contained nextgroup=myperl6InterpSuffix
syn region myperl6InterpHashIndexC start="{" end="}" contained contains=TOP nextgroup=myperl6InterpSuffix
syn region myperl6InterpCall start="(" end=")" contained contains=TOP nextgroup=myperl6InterpSuffix
syn match myperl6InterpMethod "\.\h\%(\w\|-\a\|'\a\)*(\@=" contained nextgroup=myperl6InterpCall
syn cluster myperl6InterpSuffix contains=myperl6InterpArrayIndex,myperl6InterpHashIndexA,myperl6InterpHashIndexC,myperl6InterpCal,myperl6InterpSub,myperl6InterpMethod

syn match myperl6RegexStringEscape "\\['\"]" contained
 " Dummy rule for matchgroup=
syn match myperl6Nothing "" contained

hi link myperl6Binding Identifier
hi link myperl6VarBinding Identifier
hi link myperl6RegexBinding Identifier
hi link myperl6LineComment Comment
hi link myperl6Pod Comment
hi link myperl6BlockCommentP Comment
hi link myperl6BlockCommentA Comment
hi link myperl6BlockCommentS Comment
hi link myperl6BlockCommentC Comment
hi link myperl6BlockCommentCC Comment
hi link myperl6Title Title
hi link myperl6Number Constant
hi link myperl6StringQ Constant
hi link myperl6StringQQ Constant
hi link myperl6QW Constant
hi link myperl6RegexChar Constant
hi link myperl6InterpScalar NONE
hi link myperl6InterpArray NONE
hi link myperl6InterpHash NONE
hi link myperl6InterpSub NONE
hi link myperl6InterpBlock NONE
