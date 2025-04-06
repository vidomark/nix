"""""""""""""""""""
" Diagnostics Commands "
"""""""""""""""""""

" Commands for navigating and handling errors and diagnostics
let g:WhichKeyDesc_error                                   = "<leader>e Diagnostics"

" Go to Next Error
let g:WhichKeyDesc_error_next                              = "<leader>ek Go to Next Error"
map <leader>ek <Action>(GotoNextError)

" Go to Previous Error
let g:WhichKeyDesc_error_previous                          = "<leader>ej Go to Previous Error"
map <leader>ej <Action>(GotoPreviousError)

" Show Error Description
let g:WhichKeyDesc_error_description                       = "<leader>ed Show Error Description"
map <leader>ed <Action>(ShowErrorDescription)

" Explain Plan
let g:WhichKeyDesc_code_explain_plan                       = "<leader>ep Explain Plan"
map <leader>ep <Action>(Console.Jdbc.ExplainPlan)

" Explain Plan (Raw)
let g:WhichKeyDesc_code_explain_plan_raw                   = "<leader>eP Explain Plan (Raw)"
map <leader>eP <Action>(Console.Jdbc.ExplainPlan.Raw)

" Explain Analyze Plan
let g:WhichKeyDesc_code_explain_analyse_plan               = "<leader>ea Explain Analyze Plan"
map <leader>ea <Action>(Console.Jdbc.ExplainAnalyse)

" Explain Analyze Plan (Raw)
let g:WhichKeyDesc_code_explain_analyse_plan_raw           = "<leader>eA Explain Analyze Plan (Raw)"
map <leader>eA <Action>(Console.Jdbc.ExplainAnalyse.Raw)
