"""""""""""""""""""
" Debug Commands "
"""""""""""""""""""

" Commands for debugging actions
let g:WhichKeyDesc_debug                                = "<leader>d Debug"

" Start Debugging
let g:WhichKeyDesc_debug_debug                          = "<leader>dt Start Debugging"
map <leader>dt <Action>(Debug)

" Context Debug
let g:WhichKeyDesc_debug_contextdebug                   = "<leader>dj Context Debug"
map <leader>dj <Action>(ContextDebug)

" Choose Debug Configuration
let g:WhichKeyDesc_debug_choosedebug                    = "<leader>dE Choose Debug Configuration"
map <leader>dE <Action>(ChooseDebugConfiguration)

" Run
let g:WhichKeyDesc_debug_run                            = "<leader>dr Run"
map <leader>dr <Action>(Run)

" Context Run
let g:WhichKeyDesc_debug_contextrun                     = "<leader>dl Context Run"
map <leader>dl <Action>(ContextRun)

" Choose Run Configuration
let g:WhichKeyDesc_debug_chooserun                      = "<leader>dR Choose Run Configuration"
map <leader>dR <Action>(ChooseRunConfiguration)

" Stop (Kill)
let g:WhichKeyDesc_debug_stop                           = "<leader>dk Stop (Kill)"
map <leader>dk <Action>(Stop)

" Toggle Line Breakpoint
let g:WhichKeyDesc_debug_togglelinebreakpoint           = "<leader>db Toggle Line Breakpoint"
map <leader>db <Action>(ToggleLineBreakpoint)

" Mute All Breakpoints
let g:WhichKeyDesc_debug_muteallbreakpoints             = "<leader>dm Mute All Breakpoints"
map <leader>dm <Action>(XDebugger.MuteBreakpoints)

" View All Breakpoints
let g:WhichKeyDesc_debug_showbreakpoints                = "<leader>ds View All Breakpoints"
map <leader>ds <Action>(ViewBreakpoints)

" Remove All Breakpoints
let g:WhichKeyDesc_debug_removeallbreakpoints           = "<leader>dd Remove All Breakpoints"
map <leader>dd <Action>(Debugger.RemoveAllBreakpoints)

" Step Over
let g:WhichKeyDesc_debug_stepover                       = "<leader>do Step Over"
map <leader>do <Action>(StepOver)

" Step Into
let g:WhichKeyDesc_debug_stepinto                       = "<leader>di Step Into"
map <leader>di <Action>(StepInto)

" Step Out
let g:WhichKeyDesc_debug_stepout                        = "<leader>dO Step Out"
map <leader>dO <Action>(StepOut)

" Resume
let g:WhichKeyDesc_debug_continue                       = "<leader>dc Resume"
map <leader>dc <Action>(Resume)

" Quick Evaluate Expression
let g:WhichKeyDesc_debug_quickevaluate                  = "<leader>dx Quick Evaluate Expression"
map <leader>dx <Action>(QuickEvaluateExpression

" Evaluate Expression
let g:WhichKeyDesc_debug_evaluate                       = "<leader>de Evaluate Expression"
map <leader>de <Action>(EvaluateExpression)

" Add To Watch
let g:WhichKeyDesc_debug_watch                          = "<leader>dw Add To Watch"
map <leader>dw <Action>(Debugger.AddToWatch)

" Run To Cursor
let g:WhichKeyDesc_run_to_cursor                        = "<leader>da Run To Cursor"
map <leader>da <Action>(RunToCursor)
