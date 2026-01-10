syn match myx64Label "[a-zA-Z0-9_$.]\+:\@="
syn match myx64Directive "[a-zA-Z0-9_$.]\@<!\.[a-zA-Z0-9_$.]\+"

syn keyword myx64ImplicitReg aaa aad aam aas cbw cdq cdqe cmpxchg cmpxchg16b cmpxchg8b cpuid cqq cwd cwde daa das div encodekey128 encodekey256 enter in lahf leave lods lodsb lodsd losdq lodsw movs movsb movsq movsw mul mulx pcmpestri pcmpestrm pcmpistri pcmpistrm popa popad rdmsr rdpkru rdpmc rdtsc rdtscp xlat xlatb

syn keyword myx64Bind adc adcx add addpd addps addsd addss addsubpd addsubps adox aesdec aesdec128kl aesdec256kl aesdeclast aesdecwide128kl aesdecwide256kl aesenc aesenc128kl aesenc256kl aesenclast aesencwide128kl aesencwide256kl aesimc aeskeygenassist and andn andnpd andnps andpd andps bextr blendpd blendps blendvpd blendvps blsi blsmsk blsr bsf bsr bswap bt btc btr bts bzhi cmova cmovae cmovb cmovbe cmovc cmove cmovg cmovge cmovl cmovle cmovna cmovnae cmovnb cmovnbe cmovnc cmovne cmovng cmovnge cmovnl cmovnle cmovno cmovnp cmovns cmovnz cmovo cmovp cmovpe cmovpo cmovs cmovz crc32 cvtdq2pd cvtdq2ps cvtpd2dq cvtpd2pi cvtpd2ps cvtpi2pd cvtpi2ps cvtps2dq cvtps2pd cvtps2pi cvtsd2si cvtsd2ss cvtsi2sd cvtsi2ss cvtss2sd cvtss2si cvttpd2dq cvttpd2pi cvttps2dq cvttps2pi cvttsd2si cvttss2si dec divpd divps divsd divss dppd dpps extractps gf2p8affineqb gf2p8affineinvqb gf2p8mulb haddpd haddps hsubpd hsubps idiv imul inc kaddb kaddd kaddq kaddw kandb kandd kandnb kandnd kandnq kandnw kandq kandw kmovb kmovd kmovq kmovw knotb knotd knotq knotw korb kord korq korw kshiftlb kshiftld kshiftlq kshiftlw kshiftrb kshiftrd kshiftrq kshiftrw kunpckbw kunpckdq kunpckwd kxnorb kxnord kxnorq kxnorw kxorb kxord kxorq kxorw lar lddqu lds lea les lfs lgs lsl lss lzcnt maxpd maxps maxsd maxss minpd minps minsd minss mov movapd movaps movbe movd movddup movdq2q movdqa movdqu movhlps movhpd movhps movlhps movlpd movlps movmskpd movmskps movntdqa movq movq2dq movsd movshdup movsldup movss movsx movsxd movupd movups movzx mpsadbw mulpd mulps mulsd mulss neg not or orpd orps pabsb pabsd pabsq pabsw packssdw packsswb packusdw packuswb paddb paddd paddq paddsb paddsw paddusb paddusw paddw palignr pand pandn pavgb pavgw pblendvb pblendw pclmulqdq pcmpeqb pcmpeqd pcmpeqq pcmpeqw pcmpgtb pcmpgtd pcmpgtq pcmpgtw pdep pext pextrb pextrd pextrq pextrw phaddd phaddsw phaddw phminposuw phsubd phsubsw phsubw pinsrb pinsrd pinsrq pinsrw pmaddubsw pmaddwd pmaxsb pmaxsd pmaxsq pmaxsw pmaxub pmaxud pmaxuq pmaxuw pminsb pminsd pminsq pminsw pminub pminud pminuq pminuw pmovmskb pmovsx pmovzx pmuldq pmulhrsw pmulhuw pmulhw pmulld pmullq pmullw pmuludq pop popcnt por psadbw pshufb pshufd pshufhw pshuflw pshufw psignb psignd psignw pslld pslldq psllq psllw psrad psraq psraw psrld psrldq psrlq psrlw psubb psubd psubq psubsb psubsw psubusb psubusw psubw punpckhbw punpckhdq punpckhqdq punpckhwd punpcklbw punpcklhdq punpcklqdq punpcklwd pxor rcl rcpps rcpss rcr rdfsbase rdgsbase rdpid rdrand rdseed rdsspd rdsspq rol ror rorx roundpd roundps roundsd roundss rsqrtps rsqrtss sal sar sarx sbb seta setae setb setbe setc sete setg setge setl setle setna setnae setnb setnbe setnc sestne setng sestnge setnl setnle setno setnp setns setnz seto setp setpe setpo sets setz sha1msg1 sha1msg2 sha1nexte sha1rnds4 sha256msg1 sha256msg2 sha256rnds2 shl shld shlx shr shrd shrx shufpd shufps sqrtpd sqrtps sqrtsd sqrtss str sub subpd subps subsd subss tdpbf16ps tdpbssd tdpbsud tdpbusd tdpbuud tileloadd tileloaddt1 tilezero tzcnt unpackhpd unpackhps unpacklpd unpacklps xor xorpd xorps nextgroup=myx64Binding,myx64NotBinding skipwhite

syn keyword myx64NotBinding BYTE DWORD PTR QWORD WORD XMMWORD YMMWORD ZMMWORD

syn match myx64Binding "[a-zA-Z0-9_$][a-zA-Z0-9_$.]*" contained

syn keyword myx64Bind2 xadd xchg nextgroup=myx64Binding2

syn match myx64Binding2 "[a-zA-Z0-9_$][a-zA-Z0-9_$.]*" contained nextgroup=myx64Binding,myx64NotBinding skipwhite

syn keyword myx64Jump call hlt int int1 int3 into iret iretd iretq jmp ret rsm syscall sysenter sysexit sysret ud ud0 ud1 ud2 uiret xabort
syn keyword myx64Branch ja jae jb jbe jc jcxz jecxz jrcxz je jg jge jl jle jna jnae jnb jnbe jnc jne jng jnge jnl jnle jno jnp jns jnz jo jp jpe jpo js jz loop loope loopne xbegin xend
syn keyword myx64JumpBind nextgroup=myx64Binding

 " Constants basically copied wholesale from mycpp2, I haven't learned the precise syntax yet.
syn match myx64Number "\%(\w\@<![+-]\)\?\%(\<[0-9]\+\.\?\|\.[0-9]\+\)\%([eEpP][+-]\?[0-9]\+\)\?\h*"
syn match myx64Hexadecimal "\%(\w\@<![+-]\)\?\<0[xX][0-9a-fA-F']\+\h*"  " TODO: hex floats?
syn match myx64Octal "\%(\w\@<![+-]\)\?\<0[0-7']\+\h*" contains=mycppOctalZero
syn match myx64OctalZero "\<0" contained
syn match myx64Binary "\%(\w\@<![+-]\)\?\<0[bB][01']\+\h*"
 " Assume all-caps identifiers that aren't in a type position are constants
syn match myx64MiscConstant "\<[A-Z_][0-9A-Z_]\+\>\%(\%([*&]*\_s\+\|\_s+[*&]*\_s\@!\)\h\|[({<]\|::\)\@!"
 " Sometimes there's a convention to begin constants with c_
syn match myx64c_Constant "\<c_\w*\>"
syn match myx64Char "\h*'\%([^']\|\\'\|\\[^']+\)'"
syn region myx64String start=+\h*"+ skip=+\\\\\|\\"+ end=+"\|$+ oneline

syn keyword myx64SpecialConstant e8 e16 e32 e64 m1 m2 m4 m8 ta ma tu mu

syn region myx64LineComment start="#" end="$" keepend
syn region myx64LineCommentTitle start="###" end="$" keepend

hi def link myx64Binary Constant
hi def link myx64Binding Identifier
hi def link myx64Binding2 Identifier
hi def link myx64Branch Statement
hi def link myx64Char Constant
hi def link myx64Directive PreProc
hi def link myx64Hexadecimal Constant
hi def link myx64Jump Statement
hi def link myx64JumpBind Statement
hi def link myx64Label Type
hi def link myx64LineComment Comment
hi def link myx64LineCommentTitle Title
hi def link myx64MiscConstant Constant
hi def link myx64Number Constant
hi def link myx64Octal Constant
hi def link myx64OctalZero PreProc
hi def link myx64PreProc PreProc
hi def link myx64RawString Constant
hi def link myx64SpecialConstant Constant
hi def link myx64String Constant
hi def link myx64c_Constant Constant
