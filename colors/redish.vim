"
" VIM COLOR SCHEME
"
" Maintainer:   aparaatti
" Inspirations: murphy, Gruvbox
" Thanks:       bravekarma@reddit (commit "curren statusline text pink, non current white")
"

hi clear
" doesn't really work on light background, hence light is not supported
set background=dark
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'redish'


""""""""""
" COLORS "
""""""""""

if exists("g:redish_transparent") && g:redish_transparent == 1
    let s:normal_bg           = [ 'NONE', 'NONE' ]
else
    let s:normal_bg           = [ '#111111', '235' ]
endif

let s:normal_fg           = [ '#C2C2C2', 250 ] " 250 249
let s:focus_fg            = [ '#af5f5f', 131 ]

let s:lighthighlight      = [ '#FF875F', 209 ]
let s:stand_out1          = [ '#FF00FF', 201 ]
let s:stand_out2          = [ '#FFCC00', 208 ]

let s:slightestred        = [ '#D78787', 174 ]
let s:slightred           = [ '#aa4538', 167 ]
let s:red                 = [ '#D75F5F', 167 ]
let s:red_dim             = [ '#AF0000', 196 ]
let s:red_dimmer          = [ '#9F0000', 124 ]

let s:lightgray           = [ '#606060', 240 ]
let s:gray                = [ '#303030', 236 ]
let s:darkgray            = [ '#121212', 233 ]
let s:black               = [ 'Black', 'Black' ]

""""""""""""""""
" COLOR GROUPS "
""""""""""""""""

" TODO: link sames sanely "

function! s:SetHl(group, fg, bg)
  execute join([ 'highlight', a:group,
        \ 'guifg=' . a:fg[0],
        \ 'ctermfg=' . a:fg[1],
        \ 'guibg=' . a:bg[0],
        \ 'ctermbg=' . a:bg[1],
        \ ] , ' ')
endfunction

function! s:Link(group_inheriting, group_inherited)
    execute join([ 'highlight clear', a:group_inheriting ], ' ')
    execute join([ 'highlight link', a:group_inheriting, a:group_inherited ], ' ')
endfunction

call s:SetHl('Normal', s:normal_fg, s:normal_bg)
call s:SetHl('Visual', s:slightred, s:gray)

" SYNTAX "
call s:SetHl('Comment', s:red_dimmer, s:normal_bg)
call s:SetHl('Constant', s:slightestred, s:normal_bg)
call s:SetHl('Identifier', s:slightred, s:normal_bg)
call s:SetHl('Ignore', s:red, s:normal_bg)
call s:SetHl('Operator', s:normal_fg, s:normal_bg)
call s:SetHl('PreProc', s:slightred, s:normal_bg)
call s:SetHl('Special', s:red, s:normal_bg)
call s:SetHl('SpecialKey', s:focus_fg, s:normal_bg)
call s:SetHl('Statement', s:slightestred, s:normal_bg)
call s:SetHl('Title', s:slightestred, s:normal_bg)
call s:SetHl('Todo', s:normal_bg, s:red)
call s:SetHl('Type', s:red, s:normal_bg)
call s:SetHl('NonText', s:lightgray, s:normal_bg)

" MISC "
call s:SetHl('Underlined', s:lighthighlight, s:normal_bg)
call s:SetHl('Directory', s:focus_fg, s:normal_bg)
call s:SetHl('LineNr', s:red, s:normal_bg)
call s:SetHl('EndOfBuffer', s:black, s:normal_bg)

" MENU "
call s:SetHl('Pmenu', s:slightestred, s:gray)
call s:SetHl('PmenuSel', s:gray, s:slightestred)
call s:SetHl('PmenuSbar', s:lighthighlight, s:normal_bg)
call s:SetHl('PmenuThumb', s:lighthighlight, s:normal_bg)
call s:SetHl('WildMenu', s:slightestred, s:gray)

" TERMINAL "
if has('nvim')
    call s:SetHl('TermCursor', s:normal_bg, [202, 202])
    call s:SetHl('TermCursorNC', s:normal_bg, [130, 130])
else
    call s:Link('StatusLineTerm', 'StatusLine')
    call s:Link('StatusLineTermNC', 'StatusLineNc')
end

" LINES AND COLUMNS "
call s:SetHl('StatusLine', s:slightred, s:darkgray)
call s:SetHl('StatusLineNC', s:normal_fg, s:darkgray)
call s:SetHl('VertSplit', s:gray, s:darkgray)

call s:SetHl('TabLine', s:normal_fg, s:darkgray)
call s:SetHl('TabLineSel', s:slightred, s:normal_bg)
call s:SetHl('TabLineFill', s:gray, s:darkgray)

call s:SetHl('SignColumn', s:normal_fg, s:gray)

call s:SetHl('CursorLine', s:red_dimmer, s:normal_bg)
call s:Link('CursorColumn', 'CursorLine')

call s:SetHl('ColorColumn', s:slightestred, s:normal_bg)

" FOLD "
call s:SetHl('Folded', s:lightgray, s:gray)
call s:Link('FoldColumn', 'Folded')

" DIFF "
call s:SetHl('DiffAdd', s:focus_fg, s:normal_bg)
call s:SetHl('DiffChange', s:slightestred, s:gray)
call s:SetHl('DiffDelete', s:red_dim, s:normal_bg)
call s:SetHl('DiffText', s:red_dim, s:gray)

" ERRORS, WARNINGS AND MESSAGES "
call s:SetHl('ModeMsg', s:red, s:normal_bg)
call s:SetHl('MoreMsg', s:red, s:normal_bg)
call s:SetHl('Question', s:red, s:normal_bg)
call s:SetHl('Error', s:normal_bg, s:focus_fg)
call s:SetHl('ErrorMsg',   s:stand_out1, s:normal_bg)
call s:SetHl('WarningMsg', s:stand_out1, s:normal_bg)

if has('nvim')
    call s:Link('ErrorMsg', 'NvimInternalError')
end

" SPELL "
call s:SetHl('SpellBad', s:red, s:normal_bg)
call s:SetHl('SpellCap', s:stand_out2, s:normal_bg)
call s:SetHl('SpellRare', s:stand_out2, s:normal_bg)
call s:SetHl('SpellLocal', s:stand_out2, s:normal_bg)

" SEARCH MATCHES "
call s:SetHl('IncSearch', s:black, s:lighthighlight)
call s:SetHl('MatchParen', s:stand_out2, s:black)
call s:SetHl('Search', s:black, s:slightred)
call s:SetHl('Substitute', s:black, s:slightred)

" PLUGIN SPECIFIC "
call s:SetHl('VimwikiBold', s:slightestred, s:normal_bg)
call s:SetHl('VemTablineTabNormal', s:normal_fg, s:darkgray)


""""""""""""""
" FORMATTING "
""""""""""""""

function! s:SetHlFormat(group, term, gui)
  execute join([ 'hi', a:group,
              \ 'term=' . a:term,
              \ 'cterm=' . a:term,
              \ 'gui=' . a:gui
              \ ], ' ')
endfunction

call s:SetHlFormat('Visual', 'bold', 'NONE')

" Syntax "
call s:SetHlFormat('Comment', 'bold', 'NONE')
call s:SetHlFormat('Constant', 'bold', 'NONE')
call s:SetHlFormat('Identifier', 'bold', 'NONE')
call s:SetHlFormat('PreProc', 'NONE', 'NONE')
call s:SetHlFormat('Special', 'bold', 'NONE')
call s:SetHlFormat('SpecialKey', 'bold', 'NONE')
call s:SetHlFormat('Statement', 'bold', 'bold')
call s:SetHlFormat('Title', 'bold', 'bold')
call s:SetHlFormat('Todo', 'bold', 'NONE')
call s:SetHlFormat('Type', 'bold', 'bold')

" Misc "
call s:SetHlFormat('Directory', 'bold', 'NONE')
call s:SetHlFormat('Folded', 'italic', 'italic')
call s:SetHlFormat('LineNr', 'NONE', 'NONE')
call s:SetHlFormat('ModeMsg', 'bold', 'bold')
call s:SetHlFormat('MoreMsg', 'bold', 'bold')
call s:SetHlFormat('NonText', 'bold', 'bold')
call s:SetHlFormat('Question', 'italic', 'bold')

" Spell "
call s:SetHlFormat('SpellBad', 'underline', 'underline')
call s:SetHlFormat('SpellCap', 'underline', 'underline')
call s:SetHlFormat('SpellRare', 'underline', 'underline')
call s:SetHlFormat('SpellLocal', 'underline', 'underline')

" Splits "
call s:SetHlFormat('StatusLine', 'bold', 'bold')
call s:SetHlFormat('StatusLineNC', 'bold', 'bold')
call s:SetHlFormat('VertSplit', 'NONE', 'NONE')

" TabLine "
call s:SetHlFormat('TabLine', 'bold', 'bold')
call s:SetHlFormat('TabLineFill', 'bold', 'bold')
call s:SetHlFormat('TabLineSel', 'bold,underline', 'bold')

" Cursor "
call s:SetHlFormat('CursorLine', 'bold', 'bold')
call s:SetHlFormat('TermCursor', 'NONE', 'NONE')

" Standout "
call s:SetHlFormat('Error', 'standout', 'NONE')
call s:SetHlFormat('ErrorMsg', 'NONE', 'NONE')
call s:SetHlFormat('WarningMsg', 'NONE', 'NONE')

" Matches "
call s:SetHlFormat('IncSearch', 'bold', 'bold')
call s:SetHlFormat('MatchParen', 'bold', 'bold')
call s:SetHlFormat('Search', 'bold', 'bold')
call s:SetHlFormat('Substitute', 'bold', 'bold')

