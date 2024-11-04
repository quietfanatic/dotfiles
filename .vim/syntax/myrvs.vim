syn match myrvsLabel "[a-zA-Z0-9_$.]\+:\@="
syn match myrvsDirective "[a-zA-Z0-9_$.]\@<!\.[a-zA-Z0-9_$.]\+"

syn keyword myrvsBind nextgroup=myrvsBinding,myrvsBindDot skipwhite add addi addiw addw amoadd amoand amocas amomax amomaxu amomin amominu amoor amoswap amoxor and andi andn auipc bclr bclri bext bexti binv binvi bset bseti clmul clmulh clmulr clz clzw compress cpop cpopw csrr csrrc csrrci csrrs csrrsi csrrw csrrwi ctz ctzw czero div divu divuw divw fabs fadd fclass fcvt fcvtmod fdiv feq fld fle fleq flh fli flq flt fltq flw fmadd fmax fmaxm fmin fminm fmsub fmul fmv fmvh fmvp fneg fnmadd fnmsub frcsr frflags fround froundnx frrm fsgnj fsgnjn fsgnjx fsqrt fsub fvwnmsac la lb lbu ld lga lh lhu li lla lr lui lw lwu max maxu min minu mop mul mulh mulhsu mulhu mulw mv neg not or orc ori orn pack packh packw rdcycle rdcycleh rdinstret rdinstreth rdtime rdtimeh rem remu remuw remw rev rev8 rev8 rol rolw ror rori roriw rorw seqz sext sfsgnjx sh1add sh2add sh3add sll slli slliw sllw slt slti sltiu sltu snez sra srai sraiw sraw srl srli srliw srlw sub subw unzip vaadd vaaddu vadc vadd vand vasub vasubu vcpop vdiv vdivu vfadd vfclass vfcvt vfdiv vfirst vfmacc vfmadd vfmax vfmerge vfmin vfmsac vfmsub vfmul vfmv vfncvt vfnmacc vfnmadd vfnmsac vfnmsub vfrdiv vfrec7 vfredmax vfredmin vfredosum vfredusum vfrsqrt7 vfrsub vfsgnj vfsgnjn vfslide1down vfslide1up vfsqrt vfsub vfwadd vfwcvt vfwmacc vfwmsac vfwmul vfwnmacc vfwredosum vfwredusum vfwsub vid viota vl1re16 vl1re32 vl1re64 vl1re8 vl2re16 vl2re32 vl2re64 vl2re8 vl4re16 vl4re32 vl4re64 vl4re8 vl8re16 vl8re32 vl8re64 vl8re8 vle16 vle32 vle64 vle8 vmacc vmadc vmadd vmand vmandn vmax vmaxu vmerge vmfeq vmfge vmfgt vmfle vmflt vmfne vmin vminu vmnand vmnor vmor vmorn vmsbc vmsbf vmseq vmsgt vmsgtu vmsif vmsle vmsleu vmslt vmsltu vmsne vmsof vmul vmulh vmulhsu vmulhu vmv vmv1r vmv2r vmv4r vmv8r vmxnor vmxor vnclip vnclipu vnmsac vnmsub vnsra vnsrl vor vredand vredmax vredmaxu vredmin vredminu vredor vredsum vredxor vrem vremu vrgather vrgatherei16 vrsub vsadd vsaddu vsbc vsext vslide1down vslide1up vslidedown vslideup vsll vsmul vsra vsrl vssra vssrl vssub vssubu vsub vwadd vwaddu vwmacc vwmaccsu vwmaccu vwmaccus vwmul vwmulsu vwmulu vwredsum vwredsumu vwsub vwsubu vxor vzext xnor xor xori zext zip

syn match myrvsBindDot "\.[a-zA-Z]\+" contained nextgroup=myrvsBinding,myrvsBindDot skipwhite

syn match myrvsBinding "[a-zA-Z0-9_$][a-zA-Z0-9_$.]*" contained

syn keyword myrvsJump j jr call tail ret
syn keyword myrvsBranch beq bne blt bltu bge bgeu ble bleu bgt bgtu beqz bnez
syn keyword myrvsJumpBind jal jalr nextgroup=myrvsBinding,myrvsBindDot

 " Constants basically copied wholesale from mycpp2, I haven't learned the precise syntax yet.
syn match myrvsNumber "\%(\w\@<![+-]\)\?\%(\<[0-9]\+\.\?\|\.[0-9]\+\)\%([eEpP][+-]\?[0-9]\+\)\?\h*"
syn match myrvsHexadecimal "\%(\w\@<![+-]\)\?\<0[xX][0-9a-fA-F']\+\h*"  " TODO: hex floats?
syn match myrvsOctal "\%(\w\@<![+-]\)\?\<0[0-7']\+\h*" contains=mycppOctalZero
syn match myrvsOctalZero "\<0" contained
syn match myrvsBinary "\%(\w\@<![+-]\)\?\<0[bB][01']\+\h*"
 " Assume all-caps identifiers that aren't in a type position are constants
syn match myrvsMiscConstant "\<[A-Z_][0-9A-Z_]\+\>\%(\%([*&]*\_s\+\|\_s+[*&]*\_s\@!\)\h\|[({<]\|::\)\@!"
 " Sometimes there's a convention to begin constants with c_
syn match myrvsc_Constant "\<c_\w*\>"
syn match myrvsChar "\h*'\%([^']\|\\'\|\\[^']+\)'"
syn region myrvsString start=+\h*"+ skip=+\\\\\|\\"+ end=+"\|$+ oneline

syn keyword myrvsSpecialConstant e8 e16 e32 e64 m1 m2 m4 m8 ta ma tu mu

syn region myrvsLineComment start="#" end="$" keepend
syn region myrvsLineCommentTitle start="###" end="$" keepend

hi def link myrvsBinary Constant
hi def link myrvsBinding Identifier
hi def link myrvsBranch Statement
hi def link myrvsChar Constant
hi def link myrvsDirective PreProc
hi def link myrvsHexadecimal Constant
hi def link myrvsJump Statement
hi def link myrvsJumpBind Statement
hi def link myrvsLabel Type
hi def link myrvsLineComment Comment
hi def link myrvsLineCommentTitle Title
hi def link myrvsMiscConstant Constant
hi def link myrvsNumber Constant
hi def link myrvsOctal Constant
hi def link myrvsOctalZero PreProc
hi def link myrvsPreProc PreProc
hi def link myrvsRawString Constant
hi def link myrvsSpecialConstant Constant
hi def link myrvsString Constant
hi def link myrvsc_Constant Constant
