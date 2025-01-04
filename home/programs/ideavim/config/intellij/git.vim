"""""""""""""""""""
" Git Commands "
"""""""""""""""""""

" Commands for various Git actions
let g:WhichKeyDesc_git                                    = "<leader>g Git"

" Show Differences (Compare Last Version)
let g:WhichKeyDesc_git_diff                               = "<leader>gd Show Differences"
map <leader>gd <Action>(Compare.LastVersion)

" Go to Next Difference
let g:WhichKeyDesc_git_nextdiff                           = "<leader>gj Next Difference"
map <leader>gj <Action>(NextDiff)

" Go to Previous Difference
let g:WhichKeyDesc_git_previousdiff                       = "<leader>gk Previous Difference"
map <leader>gk <Action>(PreviousDiff)

" Branches
let g:WhichKeyDesc_git_branches                           = "<leader>gb Branches"
map <leader>gb <Action>(Git.Branches)

" Apply left difference
let g:WhichKeyDesc_git_apply_left_difference              = "<leader>gh Apply Left Difference"
map <leader>gh <Action>(Diff.ApplyLeftSide)

" Apply right difference
let g:WhichKeyDesc_git_apply_right_difference             = "<leader>gl Apply Right Difference"
map <leader>gl <Action>(Diff.ApplyRightSide)

" Append left difference
let g:WhichKeyDesc_git_append_left_difference             = "<leader>gH Append Left Difference"
map <leader>gH <Action>(Diff.AppendLeftSide)

" Append right difference
let g:WhichKeyDesc_git_append_right_difference            = "<leader>gL Append Right Difference"
map <leader>gL <Action>(Diff.AppendRightSide)

" Accept your changes
let g:WhichKeyDesc_git_accept_yours                       = "<leader>gn Accept Yours"
map <leader>gn <Action>(Git.ChangesView.AcceptYours)

" Accept their changes
let g:WhichKeyDesc_git_accept_theirs                      = "<leader>gp Accept Theirs"
map <leader>gp <Action>(Git.ChangesView.AcceptTheirs)

" Checkin Project
let g:WhichKeyDesc_git_checking_project                   = "<leader>gc Checkin Project"
map <leader>gc <Action>(CheckinProject)

" Git Blame
let g:WhichKeyDesc_git_blame                              = "<leader>ga Git Blame"
map <leader>ga <Action>(Annotate)
