"""""""""""""""""""""""""""
"        Finder Actions    "
"""""""""""""""""""""""""""

" Finder Actions: Open and search classes, files, symbols, etc.
let g:WhichKeyDesc_files                             = "<leader>f Files"

" Search Class
let g:WhichKeyDesc_files_search_class                = "<leader>fc Find Class"
map <leader>fc <Action>(GotoClass)

" Search File
let g:WhichKeyDesc_files_search_file                 = "<leader>ff Search File"
map <leader>ff <Action>(GotoFile)

" Manage Recent Projects
let g:WhichKeyDesc_files_recent_projects             = "<leader>fp Find Recent Projects"
map <leader>fp <Action>(ManageRecentProjects)

" Find Actions
let g:WhichKeyDesc_files_actions                     = "<leader>fa Find Actions"
map <leader>fa <Action>(GotoAction)

" Find in Files (Grep)
let g:WhichKeyDesc_files_grep                        = "<leader>fg Find in Files (Grep)"
map <leader>fg <Action>(FindInPath)

" Recent Files
let g:WhichKeyDesc_files_recent_files                = "<leader>fh Find Recent Files (History)"
map <leader>fh <Action>(RecentFiles)

" Recent Locations
let g:WhichKeyDesc_files_recent_locations            = "<leader>fm Find Recent Locations (Marks)"
map <leader>fm <Action>(RecentLocations)

" Find Symbol
let g:WhichKeyDesc_files_symbol                      = "<leader>fs Find Symbol"
map <leader>fs <Action>(GotoSymbol)

" Find in Current File
let g:WhichKeyDesc_files_find                        = "<leader>fd Find in Current File"
map <leader>fd <Action>(Find)

" Find and Replace in Current File
let g:WhichKeyDesc_files_replace                     = "<leader>fr Find and Replace in Current File"
map <leader>fr <Action>(Replace)

" Find and Replace in Files
let g:WhichKeyDesc_files_replace_in_files            = "<leader>fR Find and Replace in Files"
map <leader>fR <Action>(ReplaceInPath)

" Find in Clipboard
let g:WhichKeyDesc_files_clipboard                   = "<leader>fx Find in Clipboard"
map <leader>fx <Action>(PasteMultiple)

" Find in TODO List
let g:WhichKeyDesc_files_todo                        = "<leader>ft Find in TODO List"
map <leader>ft <Action>(ActivateTODOToolWindow)

" Select file in project view
let g:WhichKeyDesc_select_in_project_view            = "<leader>fj Select file in project view"
map <leader>fj <Action>(SelectInProjectView)
