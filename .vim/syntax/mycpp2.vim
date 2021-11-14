" This is a syntax highlighter for C++ that tries to highlight the binding occurrences of words.
" Author: quietfanatic
" License: same terms as vim


""""" BINDINGS
 " Declarations always start with some bare identifier
syn match mycppIdentifier "\<\h\w*\>" nextgroup=mycppIdentifierTemplate,mycppStars,mycppVariadicOperator,mycppishArrayType skipnl transparent
 " Then there can be some namespaces; Technically this makes it not a binding occurence of the name, but highlighting this is still useful for navigation
syn match mycppBindingNamespace "\_s*\h\w*\_s*\%(<\|::\)\@=" contained nextgroup=mycppBindingNamespaceTemplate,mycppBindingNamespaceOperator
syn region mycppBindingNamespaceTemplate matchgroup=mycppBindingNamespaceTemplate start="<" end=">\|$" contained contains=mycppTemplate nextgroup=mycppBindingNamespaceOperator,mycppStars skipnl
syn match mycppBindingNamespaceOperator "::\_s*" contained nextgroup=mycppBindingNamespace,mycppVarBinding,mycppFunctionBinding,mycppBindingOperator skipnl
 " Can be followed by a template parameter list
syn region mycppIdentifierTemplate matchgroup=mycppIdentifierTemplate start="<" end=">\|$" contained contains=mycppTemplate,@mycppConstants nextgroup=mycppStars,mycppVariadicOperator,mycppishArrayType skipnl
syn region mycppTemplate matchgroup=mycppTemplate start="<" end=">\|$" contained contains=mycppTemplate,@mycppConstants
 " Followed by optional *s and &s but a non-optional space.  This matches 'type* name' and 'type *name' but not 'type * name' or 'type*name'
syn match mycppStars "[*&]*\_s\+\|\_s+[*&]*\_s\@!" contained nextgroup=mycppBindingNamespace,mycppVarBinding,mycppFunctionBinding,mycppBindingOperator skipnl
 " Or there can be a ... for variadic stuff
syn match mycppVariadicOperator "\.\.\." contained nextgroup=mycppVarBinding skipnl
 " (Recognize Java/C#-style arrays also)
syn match mycppishArrayType "\[\]\_s*" contained nextgroup=mycppishArrayType,mycppVarBinding,mycppFunctionBinding skipnl

 " Then finally the binding word.  It's a variable/parameter if followed by one of {[=;,>):
syn match mycppVarBinding "\h\w*\_s*\%([{[=;,>)(\]]\|::\@!\)\@=" contained nextgroup=mycppVarBindingComma
 " (A concession to bad-style comma-delimited variable declarations)
syn match mycppVarBindingComma "\_s*,\_s*" contained nextgroup=mycppVarBinding skipnl
 " Or a function if followed by (
 " Unfortunately this also matches variables initialized with legacy constructor syntax, but that was dumb anyway.
syn match mycppFunctionBinding "\h\w*\%(\_s*(\)\@=" contained
 " for operator bindings, highlight the operator part
syn match mycppBindingOperator "\<operator\>\_s*" contained nextgroup=mycppOperatorBinding skipnl
syn match mycppOperatorBinding "\S\+\%(\_s*(\)\@=" contained

 " Special treatment for destructuring.  This is just a quick hack, so it
 " may not catch all situations
syn region mycppDestructure matchgroup=mycppDestructure start="auto&\?&\?\_s*\[" end="]" contains=mycppVarBinding

 " Special treatment for class-like declarations.
 " Even though the above rules would catch most of them, certain situations (like the final keyword) can throw them off
syn keyword mycppClassKeyword class namespace struct union nextgroup=mycppClassBinding skipnl
syn match mycppClassBinding "\_s*\h\w*" contained


""""" COMMENTS
syn region mycppLineComment start="//" end="$" keepend
syn region mycppLineCommentTitle start="////" end="$" keepend
syn region mycppBlockComment start="/\*" end="\*/"

""""" PREPROCESSOR (and similar things)
syn region mycppPreProc matchgroup=mycppPreProc start="^\s*#\w\+" skip="\\\n" end="$" contains=TOP
syn match mycppInclude "^\s*#include\>\_s*" nextgroup=mycppIncludeFilename
syn match mycppIncludeFilename +".*"\|<.*>+ contained
syn match mycppDefine "^\s*#define\>\_s*" nextgroup=mycppDefineBinding
syn match mycppDefineBinding "\h\w*" contained

syn match mycppUsingNamespace "\<using\_s\+namespace\>"
syn match mycppMacroCall "\<[A-Z_][0-9A-Z_]*(\@="

""""" CONSTANTS
 " We're not going to list all the different recognized postfix/prefix modifier letters for numbers and strings, we'll just accept anything
syn match mycppNumber "\%(\w\@<![+-]\)\?\%(\<[0-9]\+\.\?\|\.[0-9]\+\)\%([eEpP][+-]\?[0-9]\+\)\?\h*"
syn match mycppHexadecimal "\%(\w\@<![+-]\)\?\<0[xX][0-9a-fA-F]\+\h*"  " TODO: hex floats?
syn match mycppOctal "\%(\w\@<![+-]\)\?\<0[0-7]\+\h*" contains=mycppOctalZero
syn match mycppOctalZero "\<0" contained
syn keyword mycppKeywordConstant true false nullptr sizeof alignof typeid decltype
 " Assume all-caps identifiers that aren't in a type position are constants
syn match mycppMiscConstant "\<[A-Z_][0-9A-Z_]*\>\%(\%([*&]*\_s\+\|\_s+[*&]*\_s\@!\)\h\|[({<]\|::\)\@!"
 " I hate this, but identifiers with :: in them where each component begins with a capital are likely members of an enum class.
syn match mycppEnumClassConstant "\%(\<[A-Z]\w*::\)\+[A-Z]\w*\>\%(\%([*&]*\_s\+\|\_s+[*&]*\_s\@!\)\h\|[({<>]\|::\)\@!"
 " Sometimes there's a convention to begin static constants with c_
syn match mycppc_Constant "\<c_\w*\>"
syn match mycppChar "\h*'\%([^']\|\\'\|\\[^']+\)'"
syn region mycppString start=+\h*"+ skip=+\\\\\|\\"+ end=+"\|$+ oneline
syn region mycppRawString start=+R"\z([^()\s\\]*\)(+ end=+)\z1"+
syn cluster mycppConstants contains=mycppNumber,mycppHexadecimal,mycppOctal,mycppKeywordConstant,mycppMiscConstant,mycppChar,mycppString,mycppRawString,mycppEnumClassConstant,mycppc_Constant

""""" KEYWORDS AND STUFF
 " Highlight anything that can change control flow or allocate memory
syn keyword mycppStatement _Exit abort asm break case catch continue default delete do else exit free for goto if longjmp malloc new quick_exit raise realloc return setjmp switch system throw try while yield
 " These operators can change the control flow, so highlight them too.
syn match mycppControlOperator "?\|&&\|||"
syn keyword mycppContolOperator and or

 " Grey these out to lower noise
syn keyword mycppMiscKeyword explicit final inline override private protected public template virtual
syn match mycppSalKeyword "\<__\@!\h\w*_\@<!_\>"
syn keyword mycppAssert assert ASSERT static_assert NT_ASSERT Release_Assert

syn region mycppMergeMarker start="^\%(<<<<<<<\||||||||\|=======\|>>>>>>>\)" end="$" keepend


hi def link mycppAssert StorageClass
hi def link mycppBlockComment Comment
hi def link mycppc_Constant Constant
hi def link mycppClassBinding Identifier
hi def link mycppControlOperator Statement
hi def link mycppDefine PreProc
hi def link mycppDefineBinding Identifier
hi def link mycppEnumClassConstant Constant
hi def link mycppFunctionBinding Type
hi def link mycppHexadecimal Constant
hi def link mycppInclude PreProc
hi def link mycppIncludeFilename Constant
hi def link mycppKeywordConstant Constant
hi def link mycppLineComment Comment
hi def link mycppLineCommentTitle Title
hi def link mycppMacroCall PreProc
hi def link mycppMergeMarker Title
hi def link mycppMiscConstant Constant
hi def link mycppMiscKeyword StorageClass
hi def link mycppNumber Constant
hi def link mycppOctal Constant
hi def link mycppOctalZero PreProc
hi def link mycppOperatorBinding Identifier
hi def link mycppPreProc PreProc
hi def link mycppSalKeyword StorageClass
hi def link mycppStatement Statement
hi def link mycppChar Constant
hi def link mycppString Constant
hi def link mycppRawString Constant
hi def link mycppUsingNamespace PreProc
hi def link mycppVarBinding Identifier
