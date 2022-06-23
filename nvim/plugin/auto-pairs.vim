au FileType {c,cpp} let b:AutoPairs = AutoPairsDefine({'/*' : '*/'})
au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
"au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->', '{%':'%}'})
au FileType htmldjango let b:AutoPairs = AutoPairsDefine({'{' : '}', '{%':'%}'})
let g:AutoPairsCenterLine = 0
