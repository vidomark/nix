"""""""""""""""""""
" Code Actions "
"""""""""""""""""""

" Commands for code actions
let g:WhichKeyDesc_leader_code                                                               = "<leader>c Code actions"

" Highlight usages in file
let g:WhichKeyDesc_code_highlightusages                                                      = "<leader>cu Highlight usages in file"
map <leader>cu <Action>(HighlightUsagesInFile)

" Show call hierarchy
let g:WhichKeyDesc_code_callhierarchy                                                        = "<leader>cc Show call hierarchy"
map <leader>cc <Action>(CallHierarchy)

" Show navigation bar
let g:WhichKeyDesc_code_navbar                                                               = "<leader>cn Show navigation bar"
map <leader>cn <Action>(ShowNavBar)

" Format code (Reformat Code, Rearrange Code, Optimize Imports)
let g:WhichKeyDesc_refactor_formatcode                                                       = "<leader>cf Format code"
map <leader>cf <Action>(ReformatCode) <Action>(RearrangeCode) <Action>(OptimizeImports)

" Compile dirty
let g:WhichKeyDesc_code_compile                                                              = "<leader>cb Compile dirty"
map <leader>cb <Action>(CompileDirty)

" Refresh project
let g:WhichKeyDesc_code_refresh                                                              = "<leader>cm Refresh project"
map <leader>cm <Action>(ExternalSystem.ProjectRefreshAction)

" Parameter info
let g:WhichKeyDesc_code_parameterinfo                                                        = "<leader>cp Parameter info"
map <leader>cp <Action>(ParameterInfo)

" Safe delete
let g:WhichKeyDesc_code_safedelete                                                           = "<leader>cd Safe delete"
map <leader>cd <Action>(SafeDelete)

" Invert boolean
let g:WhichKeyDesc_code_invertboolean                                                        = "<leader>ci Invert boolean"
map <leader>ci <Action>(InvertBoolean)

" Show intention actions
let g:WhichKeyDesc_code_showintentionactions                                                 = "<leader>ca Show intention actions"
map <leader>ca <Action>(ShowIntentionActions)
