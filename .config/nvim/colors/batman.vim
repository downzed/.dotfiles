let s:bg = '#1B1B1B'
let s:fg = '#D0D0D0'
let s:yellow = '#E6C300'
let s:blue = '#6888B8'
let s:grey_light = '#505050'
let s:grey_dark = '#303030'
let s:line_highlight = '#2A2A2A'

hi clear
if exists('syntax_on')
  syntax reset
endif
set t_Co=256
let g:colors_name = 'batman'

hi Normal guifg=s:fg guibg=s:bg
hi Comment guifg=s:blue
hi Constant guifg=s:yellow
hi String guifg=s:yellow
hi Function guifg=s:yellow
hi LineNr guifg=s:grey_light
hi HighlightLine guibg=s:line_highlight

hi pythonComment guifg=s:blue gui=italic
hi rustCommentLine guifg=s:blue gui=italic
hi rustCommentBlock guifg=s:blue gui=italic

hi DiffAdd guibg=s:grey_dark
hi DiffChange guibg=s:grey_dark
hi DiffDelete guibg=s:grey_dark
hi DiffText guibg=s:grey_dark

hi StatusLine guifg=s:fg guibg=s:grey_dark
hi VertSplit guifg=s:grey_dark

