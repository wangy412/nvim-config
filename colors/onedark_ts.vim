set termguicolors
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

hi Bold gui=bold 
hi ColorColumn guibg=#353b45 
hi Conceal guifg=#61afef 
hi Cursor guibg=#abb2bf 
hi CursorColumn guibg=#353b45 
hi CursorLine guibg=#353b45 
hi CursorLineNr guifg=#565c64 guibg=#353b45 
hi Debug guifg=#e06c75 
hi Directory guifg=#61afef 
hi Error guibg=#e06c75 
hi ErrorMsg guifg=#e06c75 
hi Exception guifg=#c678dd 
hi FoldColumn guifg=#56b6c2 guibg=#353b45 
hi Folded guifg=#545862 guibg=#353b45 
hi IncSearch guifg=#353b45 guibg=#d19a66 
hi LineNr guifg=#565c64 
hi Macro guifg=#61afef 
hi MatchParen guibg=#545862 
hi ModeMsg guifg=#98c379 
hi MoreMsg guifg=#98c379 
hi NonText guifg=#545862 
hi Normal guifg=#abb2bf 
hi NormalFloat guifg=#abb2bf guibg=#353b45 
hi NormalNC guifg=#abb2bf 
hi PMenu guifg=#abb2bf guibg=#353b45 
hi PmenuSbar guifg=#abb2bf guibg=#353b45 
hi PMenuSel guifg=#353b45 guibg=#abb2bf 
hi PmenuThumb guifg=#abb2bf guibg=#545862 
hi Question guifg=#61afef 
hi QuickFixLine guibg=#353b45 
hi Search guifg=#353b45 guibg=#e5c07b 
hi SignColumn guifg=#545862 guibg=none 
hi SpecialKey guifg=#545862 
hi StatusLine guifg=none guibg=none 
hi StatusLineNC guifg=#545862 
hi Substitute guifg=#353b45 guibg=#e5c07b 
hi TabLine guifg=#565c64 guibg=#3e4451 
hi TabLineFill guifg=#545862 guibg=#353b45 
hi TabLineSel guifg=#98c379 guibg=#353b45 
hi TermCursor guibg=#abb2bf 
hi TermCursorNC guibg=#abb2bf 
hi Title guifg=#61afef 
hi TooLong guifg=#e06c75 
hi Underlined guifg=#abb2bf gui=bold,underline 
hi VertSplit guifg=#abb2bf gui=none 
hi Visual guibg=#3e4451 
hi VisualNOS guifg=#e06c75 
hi WarningMsg guifg=#e06c75 
hi WildMenu guibg=#abb2bf 
hi SpellBad gui=undercurl guisp=#e06c75 
hi SpellLocal gui=undercurl guisp=#56b6c2 
hi SpellCap gui=undercurl guisp=#61afef 
hi SpellRare gui=undercurl guisp=#c678dd 
hi Comment guifg=#545862 gui=italic 
hi Constant guifg=#d19a66 
hi String guifg=#98c379 
hi Character guifg=#56b6c2 
hi Number guifg=#d19a66 
hi Boolean guifg=#d19a66 
hi Float guifg=#d19a66 
hi Identifier guifg=#e06c75 
hi Function guifg=#61afef 
hi Statement guifg=#c678dd 
hi Conditional guifg=#c678dd 
hi Repeat guifg=#c678dd 
hi Label guifg=#c678dd 
hi Operator guifg=#abb2bf 
hi Keyword guifg=#c678dd 
hi PreProc guifg=#e5c07b 
hi Include guifg=#61afef 
hi Define guifg=#61afef 
hi PreCondit guifg=#61afef 
hi Type guifg=#61afef 
hi StorageClass guifg=#c678dd 
hi Structure guifg=#c678dd 
hi Typedef guifg=#c678dd 
hi Special guifg=#56b6c2 
hi SpecialChar guifg=#56b6c2 
hi Tag guifg=#e5c07b gui=underline 
hi Delimiter guifg=#be5046 
hi SpecialComment guifg=#56b6c2 
hi Todo guifg=#e5c07b guibg=#353b45 
hi LspReferenceText gui=underline guisp=#565c64 
hi LspReferenceRead gui=underline guisp=#565c64 
hi LspReferenceWrite gui=underline guisp=#565c64 
hi LspDiagnosticsDefaultError guifg=#e06c75 
hi LspDiagnosticsDefaultWarning guifg=#c678dd 
hi LspDiagnosticsDefaultInformation guifg=#abb2bf 
hi LspDiagnosticsDefaultHint guifg=#56b6c2 
hi LspDiagnosticsUnderlineError gui=underline guisp=#e06c75 
hi LspDiagnosticsUnderlineWarning gui=underline guisp=#c678dd 
hi LspDiagnosticsUnderlineInformation gui=underline guisp=#be5046 
hi LspDiagnosticsUnderlineHint gui=underline guisp=#56b6c2 
hi TSAnnotation guifg=#e5c07b 
hi TSAttribute guifg=#e5c07b 
hi TSBoolean guifg=#d19a66 
hi TSCharacter guifg=#56b6c2 
hi TSComment guifg=#545862 
hi TSConstructor guifg=#56b6c2 
hi TSConditional guifg=#c678dd 
hi TSConstant guifg=#d19a66 
hi TSConstBuiltin guifg=#c678dd 
hi TSConstMacro guifg=#c678dd 
hi TSError guifg=#e06c75 
hi TSException guifg=#c678dd 
hi TSField guifg=#e06c75 
hi TSFloat guifg=#d19a66 
hi TSFunction guifg=#61afef 
hi TSFuncBuiltin guifg=#c678dd gui=italic 
hi TSFuncMacro guifg=#61afef 
hi TSInclude guifg=#61afef 
hi TSKeyword guifg=#c678dd 
hi TSKeywordFunction guifg=#c678dd 
hi TSLabel guifg=#c678dd 
hi TSMethod guifg=#61afef 
hi TSNamespace guifg=#c678dd 
hi TSNone guifg=#c678dd 
hi TSNumber guifg=#d19a66 
hi TSOperator guifg=#c678dd 
hi TSParameter guifg=#e06c75 
hi TSParameterReference guifg=#e06c75 
hi TSProperty guifg=#e5c07b 
hi TSPunctDelimiter guifg=#be5046 
hi TSPunctBracket guifg=#56b6c2 
hi TSPunctSpecial guifg=#be5046 
hi TSRepeat guifg=#c678dd 
hi TSString guifg=#98c379 
hi TSStringRegex guifg=#98c379 
hi TSStringEscape guifg=#56b6c2 
hi TSTag guifg=#e5c07b 
hi TSTagDelimiter guifg=#be5046 
hi TSText guifg=#abb2bf 
hi TSStrong gui=bold 
hi TSEmphasis guifg=#d19a66 gui=italic 
hi TSUnderline gui=underline 
hi TSStrike gui=strikethrough 
hi TSTitle guifg=#61afef 
hi TSLiteral guifg=#d19a66 
hi TSURI guifg=#d19a66 gui=underline 
hi TSType guifg=#e5c07b 
hi TSTypeBuiltin guifg=#c678dd 
hi TSVariable guifg=#e06c75 
hi TSVariableBuiltin guifg=#c678dd 
hi User1 guifg=#e06c75 guibg=#3e4451 
hi User2 guifg=#c678dd guibg=#3e4451 
hi User3 guifg=#abb2bf guibg=#3e4451 
hi User4 guifg=#56b6c2 guibg=#3e4451 
hi User5 guifg=#353b45 guibg=#3e4451 
hi User6 guifg=#abb2bf guibg=#3e4451 
hi User7 guifg=#abb2bf guibg=#3e4451 
hi User8 guibg=#3e4451 
hi User9 guibg=#3e4451 
hi DiffAdd guifg=#98c379 guibg=none 
hi DiffChange guifg=#61afef guibg=none 
hi DiffDelete guifg=#e06c75 guibg=none 
hi DiffText guifg=#61afef guibg=#353b45 
hi DiffAdded guifg=#98c379 
hi DiffFile guifg=#e06c75 
hi DiffNewFile guifg=#98c379 
hi DiffLine guifg=#61afef 
hi DiffRemoved guifg=#e06c75 
hi gitcommitOverflow guifg=#e06c75 
hi gitcommitSummary guifg=#98c379 
hi gitcommitComment guifg=#545862 
hi gitcommitUntracked guifg=#545862 
hi gitcommitDiscarded guifg=#545862 
hi gitcommitSelected guifg=#545862 
hi gitcommitHeader guifg=#c678dd 
hi gitcommitSelectedType guifg=#61afef 
hi gitcommitUnmergedType guifg=#61afef 
hi gitcommitDiscardedType guifg=#61afef 
hi gitcommitBranch guifg=#d19a66 gui=bold 
hi gitcommitUntrackedFile guifg=#e5c07b 
hi gitcommitUnmergedFile guifg=#e06c75 gui=bold 
hi gitcommitDiscardedFile guifg=#e06c75 gui=bold 
hi gitcommitSelectedFile guifg=#98c379 gui=bold 
hi FloatermBorder guibg=none 
hi GalaxylineFillSection guibg=none 
