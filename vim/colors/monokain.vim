" Sublime-like color theme, modified by Theofilos Petsios
" Heavily based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"
" To be used in 256 color mode

hi clear

set background=dark
if version > 580
	" no guarantees for version 5.8 and below, but this makes it stop
	" complaining
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name="monokain"

"
" Support for 256-color terminal
"
hi Boolean         ctermfg=135
hi Character       ctermfg=144
hi Number          ctermfg=135
hi String          ctermfg=144
hi Conditional     ctermfg=161               cterm=bold
hi Constant        ctermfg=135               cterm=bold
hi Cursor          ctermfg=16  ctermbg=253
hi Debug           ctermfg=225               cterm=bold
hi Define          ctermfg=81
hi Delimiter       ctermfg=241

hi DiffAdd                     ctermbg=24
hi DiffChange      ctermfg=181 ctermbg=239
hi DiffDelete      ctermfg=162 ctermbg=53
hi DiffText                    ctermbg=102 cterm=bold

hi Directory       ctermfg=118               cterm=bold
hi Error           ctermfg=219 ctermbg=89
hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
hi Exception       ctermfg=118               cterm=bold
hi Float           ctermfg=135
hi FoldColumn      ctermfg=67  ctermbg=16
hi Folded          ctermfg=67  ctermbg=16
hi Identifier      ctermfg=208
hi Ignore          ctermfg=244 ctermbg=232
hi IncSearch       ctermfg=193 ctermbg=16

hi Keyword         ctermfg=161               cterm=bold
hi Label           ctermfg=229               cterm=none
hi Macro           ctermfg=193
hi SpecialKey      ctermfg=81

hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi Operator        ctermfg=161

hi Comment	   ctermfg=244
hi ColorColumn	   ctermbg=236 guibg=black
" complete menu
hi Pmenu           ctermfg=81  ctermbg=16
hi PmenuSel                    ctermbg=244
hi PmenuSbar                   ctermbg=232
hi PmenuThumb      ctermfg=81

hi PreCondit       ctermfg=118               cterm=bold
hi PreProc         ctermfg=118
hi Question        ctermfg=81
hi Repeat          ctermfg=1               cterm=bold
hi Search          ctermfg=253 ctermbg=66

" marks column
hi SignColumn      ctermfg=118 ctermbg=235
hi SpecialChar     ctermfg=3               cterm=bold
hi SpecialComment  ctermfg=245               cterm=bold
hi Special         ctermfg=81  ctermbg=232
hi SpecialKey      ctermfg=245

hi Statement       ctermfg=3               cterm=bold
hi StatusLine      ctermfg=238 ctermbg=253
hi StatusLineNC    ctermfg=244 ctermbg=232
hi StorageClass    ctermfg=208
hi Structure       ctermfg=81
hi Tag             ctermfg=161
hi Title           ctermfg=166
hi Todo            ctermfg=231 ctermbg=232   cterm=bold

hi Typedef         ctermfg=81
hi Type            ctermfg=81                cterm=none
hi Underlined      ctermfg=244               cterm=underline

hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
hi VisualNOS                   ctermbg=238
hi Visual                      ctermbg=235
hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
hi WildMenu        ctermfg=81  ctermbg=16

hi CursorLine                  ctermbg=234   cterm=none
hi CursorColumn                ctermbg=234
hi LineNr          ctermfg=250
" Background in Tabs
hi TabLineFill     ctermfg=Black ctermbg=Black
" Currently active tab
hi TabLineSel 	   ctermbg=DarkGrey
" Unselected
hi TabLine 	   ctermbg=Black

syn match cFunctions display "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn match cFunctions display "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi cFunctions ctermfg=81 guifg=goldenrod
