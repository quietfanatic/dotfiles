syn match myjsBindKeyword "[0-9a-zA-Z_$]\@<!\%(var\|let\|const\|class\)[0-9a-zA-Z_$]\@!\%(\s*:\)\@!" nextgroup=myjsBinding
syn match myjsFunctionKeyword "[0-9a-zA-Z_$]\@<!function[0-9a-zA-Z_$]\@!\%(\s*:\)\@!" nextgroup=myjsFunctionStar,myjsFunctionArguments
syn match myjsFunctionStar "\s*\*" nextgroup=myjsFunctionArguments
syn match myjsFunctionArguments "\s*([^()]*)" contained contains=myjsBinding
syn match myjsBinding "\s*[a-zA-Z_$][0-9a-zA-Z_$]*" contained
syn match myjsLambda "\%([a-zA-Z_$][0-9a-zA-Z_$]*\|([^()]*)\)\s*=>\s*{" contains=myjsBinding,myjsControlOperator
syn match myjsAbbreviatedFunctionBinding "[a-zA-Z_$][0-9a-zA-Z_$]*\s*([^()]*)\s*{" contains=myjsBinding

syn region myjsComment start="//" end="$" keepend
syn region myjsTitle start="/////" end="$" keepend

syn region myjsStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=myjsStringSpecial
syn region myjsStringQ start="'" skip=+\\\\\|\\'+ end=+'+ contains=myjsStringSpecial
syn region myjsTemplate start="`" skip=+\\\\\|\\`+ end=+`+ contains=myjsStringSpecial,myjsInterpolation

syn match myjsStringSpecial "\\." contained
syn region myjsInterpolation start="\${" end="}" contained contains=TOP

syn match myjsNumber "\%([0-9a-zA-Z_$)\]}]\@<![-+]\)\?[0-9]\+\%(\.[0-9]\+\)\?\%([eE][+-]?[0-9]\+\)\?"
syn match myjsHexadecimal "0x[0-9a-fA-F]\+"

syn region myjsRegex start="\%([0-9a-zA-Z_$)\]}]\s*\)\@<!//\@!" skip="\\\\\|\\/" end="/"

syn match myjsObjectKey "[a-zA-Z_$][0-9a-zA-Z_$]*\%(\s*:\)\@="
syn keyword myjsBuiltinConstant undefined null false true

syn match myjsControl "[0-9a-zA-Z_$\.]\@<!\%(if\|else\|while\|for\|do\|switch\|case\|goto\|continue\|break\|return\|try\|await\|yield\)[0-9a-zA-Z_$]\@!\%(\s*:\)\@!"
syn match myjsControlOperator "&&\|||\|?\|=>"
syn match myjsCatch "[0-9a-zA-Z_$\.]\@<!catch[0-9a-zA-Z_$]\@!\%(\s*:\)\@!" nextgroup=myjsFunctionArguments

syn match myjsMiscKeyword "[0-9a-zA-Z_$]\@<!\%(new\|in\|async\|instanceof\|get\|set\)[0-9a-zA-Z_$]\@!\%(\s*:\)\@!"

hi def link myjsBinding Identifier
hi def link myjsComment Comment
hi def link myjsTitle Title
hi def link myjsStringQQ Constant
hi def link myjsStringQ Constant
hi def link myjsTemplate Constant
hi def link myjsStringSpecial Special
hi def link myjsNumber Constant
hi def link myjsHexadecimal Constant
hi def link myjsRegex Constant
hi def link myjsObjectKey Constant
hi def link myjsBuiltinConstant Constant
hi def link myjsControl Statement
hi def link myjsControlOperator Statement
hi def link myjsCatch Statement
hi def link myjsMiscKeyword StorageClass
hi def link myjsBindKeyword StorageClass
hi def link myjsFunctionKeyword StorageClass
