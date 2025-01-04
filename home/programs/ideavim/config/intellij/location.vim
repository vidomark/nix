"""""""""""""""""""
" Location Commands "
"""""""""""""""""""

" Commands for accessing recent locations and local history
let g:WhichKeyDesc_location                        = "<leader>l Location"

" Recent Locations
let g:WhichKeyDesc_location_recentlocs             = "<leader>lr Recent Locations"
map <leader>lr <Action>(RecentLocations)

" Local History
let g:WhichKeyDesc_location_localhistory           = "<leader>lh Local History"
map <leader>lh <Action>(LocalHistory.ShowHistory)
