"""""""""""""""""""
" Window Commands "
"""""""""""""""""""

" Commands for managing window splits and editor tabs
let g:WhichKeyDesc_window                                 = "<leader>w Window"

" Split Vertically
let g:WhichKeyDesc_window_splitvertical                   = "<leader>wv Split Vertically"
map <leader>wv <Action>(SplitVertically)

" Split and move right
let g:WhichKeyDesc_window_split_and_move_right            = "<leader>wV Split and MOVE RIGHT"
map <leader>wV <Action>(MoveTabRight) 

" Split Horizontally
let g:WhichKeyDesc_window_splithorizontal                 = "<leader>ws Split Horizontally"
map <leader>ws <Action>(SplitHorizontally)

" Split and move below
let g:WhichKeyDesc_window_split_and_move_below            = "<leader>wS Split and MOVE BELOW"
map <leader>wS <Action>(MoveTabDown)

" Unsplit Window
let g:WhichKeyDesc_window_splitundo                       = "<leader>wd Delete Window"
map <leader>wd <Action>(Unsplit)

" Unsplit all
let g:WhichKeyDesc_window_unsplit_all                     = "<leader>wD Unsplit ALL"
map <leader>wD <Action>(UnsplitAll)

" Move Editor to Opposite Tab Group
let g:WhichKeyDesc_window_movetooppositetabgroup          = "<leader>wo Move Editor to Opposite Tab Group"
map <leader>wo <Action>(MoveEditorToOppositeTabGroup)

" Edit in New Window
let g:WhichKeyDesc_window_editinnewwindow                 = "<leader>wn Edit In New Window"
map <leader>wn <Action>(EditSourceInNewWindow)

" Maximize Window
let g:WhichKeyDesc_window_maximize                        = "<leader>wm Maximize Window"
map <leader>wm <Action>(MaximizeEditorInSplit)

" Pin Active Tab
let g:WhichKeyDesc_window_pin_active_tab                  = "<leader>wp Pin Active Tab"
map <leader>wp <Action>(PinActiveTab)

" Resizing the splits
let g:WhichKeyDesc_window_stretch_left                    = "<leader>wl STRETCH split LEFT"
map <C-A-Left> <Action>(StretchSplitToLeft)
let g:WhichKeyDesc_window_stretch_down                    = "<leader>tj STRETCH split DOWN"
map <C-A-Down> <Action>(StretchSplitToBottom)
let g:WhichKeyDesc_window_stretch_up                      = "<leader>tk STRETCH split UP"
map <C-A-Up> <Action>(StretchSplitToTop)
let g:WhichKeyDesc_window_stretch_right                   = "<leader>tl STRETCH split RIGHT"
map <C-A-Right> <Action>(StretchSplitToRight)
