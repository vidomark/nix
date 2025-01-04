"""""""""""""""""""
" Go to Commands "
"""""""""""""""""""

" Commands for navigating to declarations, implementations, usages, etc.
let g:WhichKeyDesc_goto                    = "g Go to"

" Go to Declaration
let g:WhichKeyDesc_goto_declaration        = "gd Go to Declaration"
map gd <Action>(GotoDeclaration)

" Go to Type Declaration
let g:WhichKeyDesc_goto_typedeclaration    = "gy Go to Type Declaration"
map gy <Action>(GotoTypeDeclaration)

" Go to Implementation
let g:WhichKeyDesc_goto_implementation     = "gi Go to Implementation"
map gi <Action>(GotoImplementation)

" Go to Super Method
let g:WhichKeyDesc_goto_supermethod        = "gs Go to Super Method"
map gs <Action>(GotoSuperMethod)

" Show Usages (Popup)
let g:WhichKeyDesc_goto_usages             = "gr Show Usages"
map gr <Action>(ShowUsages)

" Find Usages (Tool Window)
let g:WhichKeyDesc_goto_findusages         = "gR Find Usages"
map gR <Action>(FindUsages)

" Go to Test
let g:WhichKeyDesc_goto_test               = "gt Go to Test"
map gt <Action>(GotoTest)
