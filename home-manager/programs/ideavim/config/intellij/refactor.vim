"""""""""""""""""""
" Refactoring Commands "
"""""""""""""""""""

" Commands for various refactoring actions
let g:WhichKeyDesc_refactor                                 = "<leader>r Refactor"

" Show Refactoring Actions
let g:WhichKeyDesc_refactor_showactions                     = "<leader>re Show Actions"
map <leader>re <Action>(Refactorings.QuickListPopupAction)

" Rename Element
let g:WhichKeyDesc_refactor_renameelement                   = "<leader>rn Rename Element"
map <leader>rn <Action>(RenameElement)

" Introduce Variable
let g:WhichKeyDesc_refactor_introducevariable               = "<leader>rv Introduce Variable"
map <leader>rv <Action>(IntroduceVariable)

" Introduce Constant
let g:WhichKeyDesc_refactor_introduceconstant               = "<leader>rc Introduce Constant"
map <leader>rc <Action>(IntroduceConstant)

" Introduce Field
let g:WhichKeyDesc_refactor_introducefield                  = "<leader>rf Introduce Field"
map <leader>rf <Action>(IntroduceField)

" Introduce Parameter
let g:WhichKeyDesc_refactor_introduceparameter              = "<leader>rp Introduce Parameter"
map <leader>rp <Action>(IntroduceParameter)

" Extract Method
let g:WhichKeyDesc_refactor_extractmethod                   = "<leader>rx Extract Method"
map <leader>rx <Action>(ExtractMethod)

" Optimize Imports
let g:WhichKeyDesc_refactor_optimizeimports                 = "<leader>ro Optimize Imports"
map <leader>ro <Action>(OptimizeImports)

" Inline
let g:WhichKeyDesc_refactor_inline                          = "<leader>ri Inline"
map <leader>ri <Action>(Inline)

" Change Signature
let g:WhichKeyDesc_refactor_changesignature                 = "<leader>rs Change Signature"
map <leader>rs <Action>(ChangeSignature)

" Convert Anonymous to Inner Class
let g:WhichKeyDesc_refactor_anonymoustoinner                = "<leader>ra Convert Anonymous to Inner Class"
map <leader>ra <Action>(AnonymousToInner)

" Move
let g:WhichKeyDesc_refactor_move                            = "<leader>rm Move"
map <leader>rm <Action>(Move)
