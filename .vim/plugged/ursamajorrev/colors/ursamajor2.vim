" sialoquent.vim - Vim color scheme
" ----------------------------------------------------------
" Author:   David Karlsson
" Cred: Based on vim-hemisu ( https://github.com/noahfrederick/vim-hemisu )
" ----------------------------------------------------------

" Reset syntax highlighting
hi clear
if exists("syntax_on")
  syntax reset
endif

" Declare theme name
let g:colors_name = "ursamajorrev"

" Ursa Major Colors

let s:ursamajor00 = { "gui": "#2E3440", "cterm": "0" }
let s:ursamajor01 = { "gui": "#3B4252", "cterm": "0" }
let s:ursamajor02 = { "gui": "#434C5E", "cterm": "0" }
let s:ursamajor03 = { "gui": "#515765", "cterm": "0" }
let s:ursamajor04 = { "gui": "#9299A8", "cterm": "0" }
let s:ursamajor05 = { "gui": "#9CA7BB", "cterm": "0" }
let s:ursamajor06 = { "gui": "#B0B9CB", "cterm": "0" }
let s:ursamajor07 = { "gui": "#D8DEED", "cterm": "0" }
let s:ursamajor08 = { "gui": "#9BCFE2", "cterm": "0" }
let s:ursamajor09 = { "gui": "#81A1C1", "cterm": "0" }
let s:ursamajor10 = { "gui": "#87B4B3", "cterm": "0" }
let s:ursamajor11 = { "gui": "#D3737C", "cterm": "0" }
let s:ursamajor12 = { "gui": "#E39880", "cterm": "0" }
let s:ursamajor13 = { "gui": "#E1C282", "cterm": "0" }
let s:ursamajor14 = { "gui": "#A6C18F", "cterm": "0" }
let s:ursamajor15 = { "gui": "#B892B1", "cterm": "0" }

" Define reusable colors
let s:black            = { "gui": "#393f4c", "cterm": "16"  }
let s:white            = { "gui": "#FFFFF2", "cterm": "231" }
let s:error            = { "gui": "#E74C3C", "cterm": "231" }
let s:almostWhite      = { "gui": "#C0C5CE", "cterm": "255" }
let s:middleDarkGrey   = { "gui": "#777777", "cterm": "241" }
let s:middleLightGrey  = { "gui": "#999999", "cterm": "246" }
let s:lightGrey        = { "gui": "#BBBBBB", "cterm": "249" }
let s:darkGrey         = { "gui": "#575C68", "cterm": "238" }

let s:darkPink         = { "gui": "#63001C", "cterm": "88"  }
let s:middleDarkPink   = { "gui": "#FF0055", "cterm": "197" }
let s:middleLightPink  = { "gui": "#D65E76", "cterm": "167" }
let s:lightPink        = { "gui": "#FFAFAF", "cterm": "217" }

let s:darkBlue         = { "gui": "#00838F", "cterm": "24"  }
let s:middleDarkBlue   = { "gui": "#538192", "cterm": "24"  }
let s:middleLightBlue  = { "gui": "#9FD3E6", "cterm": "116" }
let s:lightBlue        = { "gui": "#CBE4EE", "cterm": "195" }

let s:darkGreen        = { "gui": "#5F5F00", "cterm": "58"  }
let s:middleDarkGreen  = { "gui": "#739200", "cterm": "64"  }
let s:darkTan          = { "gui": "#503D15", "cterm": "52"  }
let s:lightTan         = { "gui": "#ECE1C8", "cterm": "230" }

" Custom
let s:almostBlack      = { "gui": "#393f4c", "cterm": "233" }
let s:middleYellow     = { "gui": "#EBCB8B", "cterm": "149" }
let s:lightGreen       = { "gui": "#A3BE8C", "cterm": "157" }
let s:cyan             = { "gui": "#00838F", "cterm": "800" }

" Assign to semantic categories based on background color
let s:bg         = s:ursamajor00
let s:norm       = s:ursamajor06
let s:comment    = s:ursamajor03
let s:dimmed     = s:ursamajor04
let s:subtle     = s:ursamajor02
let s:faint      = s:ursamajor01
let s:accent1    = s:ursamajor10
let s:accent2    = s:ursamajor13
let s:accent3    = s:ursamajor14
let s:accent4    = s:ursamajor15
let s:normRed    = s:ursamajor11
let s:normGreen  = s:ursamajor13
let s:normBlue   = s:ursamajor10
let s:faintRed   = s:ursamajor15
let s:faintGreen = s:ursamajor09
let s:faintBlue  = s:ursamajor08

"
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"
"
if version >= 700
  call s:h("CursorLine",  { "bg": s:faint })
  call s:h("MatchParen",  { "fg": s:accent1, "bg": s:faint, "gui": "bold" })
  call s:h("Pmenu",       { "bg": s:faint })
  call s:h("PmenuThumb",  { "bg": s:norm })
  call s:h("PmenuSBar",   { "bg": s:subtle })
  call s:h("PmenuSel",    { "bg": s:faintBlue })
  call s:h("ColorColumn", { "bg": s:faintRed })
  call s:h("SpellBad",    { "sp": s:normRed, "gui": "undercurl" })
  call s:h("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
  call s:h("SpellRare",   { "sp": s:normGreen, "gui": "undercurl" })
  call s:h("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
  hi! link CursorColumn	CursorLine

  " Use background for cterm Spell*, which does not support undercurl
  execute "hi! SpellBad   ctermbg=" s:faintRed.cterm
  execute "hi! SpellCap   ctermbg=" s:faintBlue.cterm
  execute "hi! SpellRare  ctermbg=" s:faintGreen.cterm
  execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

" Highlights - UI ------------
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent3 })
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue })
call s:h("Search",       { "bg": s:cyan })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("VertSplit",    { "fg": s:bg, "bg": s:bg })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })
hi! link WildMenu     IncSearch
hi! link FoldColumn   SignColumn
hi! link WarningMsg   ErrorMsg
hi! link MoreMsg      Title
hi! link Question     MoreMsg
hi! link ModeMsg      MoreMsg
hi! link TabLineFill  StatusLineNC
hi! link LineNr       NonText
hi! link SpecialKey   NonText

" Highlights - Generic Syntax 
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
call s:h("CursorLineNr", { "fg": s:ursamajor13 })
call s:h("CursorLine", { "bg": s:bg })
hi! link Identifier  Function
hi! link Statement   Type
hi! link Constant    Directory
hi! link Number      Constant
hi! link Special     Constant
hi! link PreProc     Constant
hi! link Error       ErrorMsg

call s:h("Error",       { "fg": s:error, "bg": s:black })

" Highlights - HTML ----------
hi! link htmlLink    Underlined
hi! link htmlTag     Type
hi! link htmlEndTag  htmlTag


" Highlights - CSS -----------
hi! link cssBraces      Delimiter
hi! link cssSelectorOp  cssBraces
hi! link cssClassName   Normal


" Highlights - Markdown ------
hi! link mkdListItem  mkdDelimiter


" Highlights - Shell ---------
hi! link shOperator  Delimiter
hi! link shCaseBar   Delimiter


" Highlights - JavaScript ----
hi! link javaScriptValue   Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces  Normal


" Highlights - Help ----------
hi! link helpExample         String
hi! link helpHeadline        Title
hi! link helpSectionDelim    Comment
hi! link helpHyperTextEntry  Statement
hi! link helpHyperTextJump   Underlined
hi! link helpURL             Underlined
