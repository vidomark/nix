"""""""""""""""""
" View Commands "
"""""""""""""""""

" Activate various tool windows and views
let g:WhichKeyDesc_view                                             = "<leader>v View"

" Activate Project Tool Window
let g:WhichKeyDesc_view_project                                     = "<leader>vf Project View"
map <leader>vf <Action>(ActivateProjectToolWindow)

" Activate Database Tool Window
let g:WhichKeyDesc_view_database                                    = "<leader>vD Database View"
map <leader>vD <Action>(ActivateDatabaseToolWindow)

" Activate Commit Tool Window
let g:WhichKeyDesc_view_commit                                      = "<leader>vc Commit View"
map <leader>vc <Action>(ActivateCommitToolWindow)

" Close Active Tab
let g:WhichKeyDesc_view_close                                       = "<leader>vq Close Active Tab"
map <leader>vq <Action>(CloseActiveTab)

" Activate Problems View Tool Window
let g:WhichKeyDesc_view_problems                                    = "<leader>vp Problems and Diagnostics View"
map <leader>vp <Action>(ActivateProblemsViewToolWindow)

" Activate Structure Tool Window
let g:WhichKeyDesc_view_structure                                   = "<leader>vs Structure View"
map <leader>vs <Action>(ActivateStructureToolWindow)

" Activate Terminal Tool Window
let g:WhichKeyDesc_view_terminal                                    = "<leader>vt Terminal"
map <leader>vt <Action>(ActivateTerminalToolWindow)

" Open In Terminal Tool Window
let g:WhichKeyDesc_open_in_terminal                                 = "<leader>vT Open In Terminal"
map <leader>vT <Action>(Terminal.OpenInTerminal)

" Activate Services Tool Window
let g:WhichKeyDesc_view_services                                    = "<leader>vv Services View"
map <leader>vv <Action>(ActivateServicesToolWindow)

" Activate Run Tool Window
let g:WhichKeyDesc_view_run                                         = "<leader>vr Debug Run"
map <leader>vr <Action>(ActivateRunToolWindow)

" Activate Debug Tool Window
let g:WhichKeyDesc_view_debug                                       = "<leader>vd Debug View"
map <leader>vd <Action>(ActivateDebugToolWindow)

" Activate Build Tool Window
let g:WhichKeyDesc_view_build                                       = "<leader>vb Build View"
map <leader>vb <Action>(ActivateBuildToolWindow)

" Activate Version Control Tool Window
let g:WhichKeyDesc_view_git                                         = "<leader>vg Version Control View"
map <leader>vg <Action>(ActivateVersionControlToolWindow)

" Activate Messages Tool Window
let g:WhichKeyDesc_view_messages                                    = "<leader>vM Messages View"
map <leader>vM <Action>(ActivateMessagesToolWindow)

" Activate TODO Tool Window
let g:WhichKeyDesc_view_todo                                        = "<leader>vo TODO View"
map <leader>vo <Action>(ActivateTODOToolWindow)

" Activate Maven Tool Window
let g:WhichKeyDesc_view_maven                                       = "<leader>vm Maven View"
map <leader>vm <Action>(ActivateMavenToolWindow)

" Activate Coverage Tool Window
let g:WhichKeyDesc_view_coverage                                    = "<leader>vC Coverage View"
map <leader>vC <Action>(ActivateCoverageToolWindow)

" Activate Gradle Tool Window
let g:WhichKeyDesc_view_gradle                                      = "<leader>vG Gradle View"
map <leader>vG <Action>(ActivateGradleToolWindow)

" Activate Endpoints Tool Window
let g:WhichKeyDesc_view_endpoints                                   = "<leader>ve Endpoints View"
map <leader>ve <Action>(ActivateEndpointsToolWindow)

" Activate Profiler Tool Window
let g:WhichKeyDesc_view_profiler                                    = "<leader>vP Profiler View"
map <leader>vP <Action>(ActivateProfilerToolWindow)

" Activate VCS Changes Tool Window
let g:WhichKeyDesc_view_changes                                     = "<leader>va Changes View"
map <leader>va <Action>(ActivateVcsChangesToolWindow)

" Activate Notification Tool Window
let g:WhichKeyDesc_view_notification                                = "<leader>vn Notification View"
map <leader>vn <Action>(ActivateNotificationsToolWindow)

" Last Window
let g:WhichKeyDesc_last_window                                      = "<leader>vl Jump To Last Window"
map <leader>vl <Action>(JumpToLastWindow)

" Hide Active Tool Window
let g:WhichKeyDesc_hide_active_tool_window                          = "<leader>vX Hide Active Tool Window"
map <leader>vX <Action>(HideActiveWindow)

" Hide All Tool Window
let g:WhichKeyDesc_hide_all_tool_window                             = "<leader>vx Hide All Tool Window"
map <leader>vx <Action>(HideAllWindows)
