

syn region mycppTemplate matchgroup=mycppTemplate start="<" end=">\|$" contained contains=mycppTemplate,@mycppConstants

syn match mycppIdentifier "\<\h\w*\>" nextgroup=mycppIdentifierTemplate,mycppStars,mycppVariadicOperator,mycppishArrayType

syn region mycppIdentifierTemplate matchgroup=mycppIdentifierTemplate start="<" end=">\|$" contained contains=mycppTemplate,@mycppConstants nextgroup=mycppStars,mycppVariadicOperator,mycppishArrayType


 " match 'type* name' and 'type *name' but not 'type * name' or 'type*name'
 " Incidentally this also matches 'type* *name' but who would do that
syn match mycppStars "[*&]*\_s\+[*&]*" contained nextgroup=mycppBindingNamespace,mycppVarBinding,mycppFunctionBinding,mycppBindingOperator
syn match mycppVariadicOperator "\.\.\." contained nextgroup=mycppVarBinding
 " For compatibility with C# and Java
syn match mycppishArrayType "\[\]\_s*" contained nextgroup=mycppishArrayType,mycppVarBinding,mycppFunctionBinding

syn match mycppBindingNamespace "\_s*\h\w*\_s*\%(<\|::\)\@=" contained nextgroup=mycppBindingNamespaceTemplate,mycppBindingNamespaceOperator

syn region mycppBindingNamespaceTemplate matchgroup=mycppBindingNamespaceTemplate start="<" end=">\|$" contained contains=mycppTemplate nextgroup=mycppBindingNamespaceOperator,mycppStars

syn match mycppBindingNamespaceOperator "::\_s*" contained nextgroup=mycppBindingNamespace,mycppVarBinding,mycppFunctionBinding,mycppBindingOperator

syn match mycppVarBinding "\h\w*\%(\_s*[{[=;,>)]\|::\@!\)\@=" contained nextgroup=mycppVarBindingComma
 " A concession to bad-style comma-delimited variable declarations
syn match mycppVarBindingComma "\_s*,\_s*" contained nextgroup=mycppVarBinding

syn match mycppFunctionBinding "\h\w*\%(\_s*(\)\@=" contained

syn match mycppBindingOperator "\<operator\>\_s*" contained nextgroup=mycppOperatorBinding
syn match mycppOperatorBinding "\S\+\%(\_s*(\)\@=" contained

syn region mycppLineComment start="//" end="$" keepend
syn region mycppBlockComment start="/\*" end="\*/"

syn region mycppPreProc matchgroup=mycppPreProc start="^\s*#\w\+" skip="\\\n" end="$" contains=TOP
syn match mycppInclude "^\s*#include" nextgroup=mycppIncludeFilename
syn match mycppIncludeFilename +\_s*\%(".*"\|<.*>\)+ contained

syn match mycppNumber "\%(\w\@<![+-]\)\?\%(\<[0-9]\+\.\?\|\.[0-9]\+\)\%([eEpP][+-]\?[0-9]\+\)\?\h*"
syn match mycppHexadecimal "\%(\w\@<![+-]\)\?\<0[xX][0-9a-fA-F]\+\h*"  " TODO: hex floats?
syn match mycppOctal "\%(\w\@<![+-]\)\?\<0[0-7]\+\h*" contains=mycppOctalZero
syn match mycppOctalZero "\<0" contained
syn keyword mycppKeywordConstant true false nullptr
syn match mycppMiscConstant "\<[A-Z_][0-9A-Z_]*\>\%(\_s*\%([a-zA-Z_(<*&]\|::\)\)\@!"
syn region mycppString start=+L\?"+ skip=+\\\\\|\\"+ end=+"+
syn cluster mycppConstants contains=mycppNumber,mycppHexadecimal,mycppOctal,mycppKeywordConstant,mycppMiscConstant,mycppString

syn keyword mycppStatement _Exit abort asm break case catch continue default delete do else exit for goto if longjmp new quick_exit raise return setjmp switch system throw try while yield
syn keyword mycppContolOperator and or
syn match mycppControlOperator "?\|&&\|||"

syn keyword mycppMiscKeyword explicit final override private protected public template virtual
syn match mycppSalKeyword "_\h\w*_"

syn keyword mycppClassKeyword class namespace struct union nextgroup=mycppClassBinding
syn match mycppClassBinding "\_s*\h\w*" contained


hi def link mycppBlockComment Comment
hi def link mycppClassBinding Identifier
hi def link mycppControlOperator Statement
hi def link mycppFunctionBinding Title
hi def link mycppHexadecimal Constant
hi def link mycppInclude PreProc
hi def link mycppIncludeFilename Constant
hi def link mycppKeywordConstant Constant
hi def link mycppLineComment Comment
hi def link mycppMiscConstant Constant
hi def link mycppMiscKeyword StorageClass
hi def link mycppNumber Constant
hi def link mycppOctal Constant
hi def link mycppOctalZero PreProc
hi def link mycppOperatorBinding Identifier
hi def link mycppPreProc PreProc
hi def link mycppSalKeyword StorageClass
hi def link mycppStatement Statement
hi def link mycppString Constant
hi def link mycppVarBinding Identifier
