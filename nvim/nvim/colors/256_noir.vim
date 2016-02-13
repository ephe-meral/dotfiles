" 256 noir. Basically: dark background, numerals & errors red,
" rest different shades of gray.
" colors 232--250 are shades of gray, from dark to light;
" 16=black, 255=white, 196=red, 88=darkred.
set background=dark
highlight clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "256_noir"

" ctermbg=NONE used to be ctermbg=16
hi Normal          ctermbg=NONE   ctermfg=250
hi Boolean         ctermbg=NONE   ctermfg=250
hi Character       ctermbg=NONE   ctermfg=196
hi Comment         ctermbg=NONE   ctermfg=240
hi Condtional      ctermbg=NONE   ctermfg=196
hi Constant        ctermbg=NONE   ctermfg=252
hi Cursor          ctermbg=255    ctermfg=16
hi ColorColumn     ctermbg=250    ctermfg=16
hi CursorColumn    ctermbg=245    ctermfg=16
hi Debug           ctermbg=NONE   ctermfg=250
hi Define          ctermbg=NONE   ctermfg=255
hi Delimiter       ctermbg=NONE   ctermfg=250
hi Directory       ctermbg=NONE   ctermfg=255
hi Error           ctermbg=88     ctermfg=255
hi Exception       ctermbg=NONE   ctermfg=250
hi Float           ctermbg=NONE   ctermfg=196
hi FoldColumn      ctermbg=NONE   ctermfg=250
hi Folded          ctermbg=NONE   ctermfg=196
hi Function        ctermbg=NONE   ctermfg=255
hi Identifier      ctermbg=NONE   ctermfg=250
hi Include         ctermbg=NONE   ctermfg=255
hi Keyword         ctermbg=NONE   ctermfg=255
hi Label           ctermbg=NONE   ctermfg=255
hi LineNr          ctermbg=NONE   ctermfg=240
hi MatchParen      ctermbg=245    ctermfg=16
hi Macro           ctermbg=NONE   ctermfg=250
hi ModeMsg         ctermbg=NONE   ctermfg=250
hi MoreMsg         ctermbg=NONE   ctermfg=250
hi NonText         ctermbg=NONE   ctermfg=240
hi Number          ctermbg=NONE   ctermfg=196
hi Operator        ctermbg=NONE   ctermfg=255
hi Pmenu           ctermbg=240    ctermfg=255
hi PmenuSel        ctermbg=250    ctermfg=16
hi PmenuSbar       ctermbg=250    ctermfg=16
hi PmenuThumb      ctermbg=240    ctermfg=232
hi PreCondit       ctermbg=NONE   ctermfg=255
hi PreProc         ctermbg=NONE   ctermfg=255
hi Question        ctermbg=NONE   ctermfg=250
hi Repeat          ctermbg=NONE   ctermfg=255
hi Search          ctermbg=NONE   ctermfg=160
hi SpecialChar     ctermbg=NONE   ctermfg=255
hi SpecialComment  ctermbg=NONE   ctermfg=245
hi Special         ctermbg=NONE   ctermfg=255
hi SpecialKey      ctermbg=255    ctermfg=16
hi Statement       ctermbg=NONE   ctermfg=255
hi StatusLine      ctermbg=255    ctermfg=196
hi StatusLineNC    ctermbg=NONE   ctermfg=250
hi StorageClass    ctermbg=NONE   ctermfg=255
hi String          ctermbg=NONE   ctermfg=245
hi Structure       ctermbg=NONE   ctermfg=255
hi Tag             ctermbg=NONE   ctermfg=196
hi Title           ctermbg=NONE   ctermfg=250
hi Todo            ctermbg=NONE   ctermfg=255
hi Typedef         ctermbg=NONE   ctermfg=255
hi Type            ctermbg=NONE   ctermfg=255
hi VertSplit       ctermbg=NONE   ctermfg=250
hi WarningMsg      ctermbg=NONE   ctermfg=196
hi WildMenu        ctermbg=255    ctermfg=240
hi Visual          ctermbg=250    ctermfg=16
hi VisualNOS       ctermbg=250    ctermfg=16
hi IncSearch       ctermbg=245    ctermfg=255
hi Search          ctermbg=236    ctermfg=245
hi ErrorMsg        ctermbg=124    ctermfg=255
hi SpellBad        ctermbg=88     ctermfg=250
hi SpellCap        ctermbg=124    ctermfg=255
hi SpellLocal      ctermbg=124    ctermfg=255
hi SpellRare       ctermbg=NONE   ctermfg=124

hi DiffAdd         ctermbg=NONE   ctermfg=255
hi DiffChange      ctermbg=255    ctermfg=160
hi DiffDelete      ctermbg=NONE   ctermfg=240
hi DiffText        ctermbg=196    ctermfg=250
hi def link diffCommon          Statement
hi def link diffRemoved         DiffDelete
hi def link diffChanged         DiffChange
hi def link diffAdded           DiffAdd

