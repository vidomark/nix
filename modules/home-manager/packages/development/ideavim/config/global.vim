""""""""""
" Global "
""""""""""

" FIXME Recent Projects and Blackhole register does not initialize on startup. Only when you reload vimrc once does it work

" Exit insert mode
inoremap jk <Esc>

" Ergonomic escape - other alternative keys I used in the past: jk, <C-j>
" map <C-c> <Esc>


" Easier navigation
map H ^
map L $
" NOTE: IdeaVim's smart join can be triggered using Ctrl + Shift + J

" Method movements
" map [m őm
" map ]m úm

" Faster change/delete of a word
map C ciw
map D daw

" NOTE: onoremap is not implemented
nnoremap cic ci{
nnoremap dic di{
nnoremap yic yi{
nnoremap vic vi{
nnoremap cac ca{
nnoremap dac da{
nnoremap yac ya{
nnoremap vac va{

" NOTE: onoremap is not implemented
nnoremap civ ci[
nnoremap div di[
nnoremap yiv yi[
nnoremap viv vi[
nnoremap cav ca[
nnoremap dav da[
nnoremap yav ya[
nnoremap vav va[

" NOTE: onoremap is not implemented
nnoremap cio ci(
nnoremap dio di(
nnoremap yio yi(
nnoremap vio vi(
nnoremap cao ca(
nnoremap dao da(
nnoremap yao ya(
nnoremap vao va(

" Select all
nnoremap <C-c> ggVG

" Better search navigation
nnoremap n nzzzv
nnoremap N Nzzzv

" Void register deletion
noremap x "_x
vnoremap c "_c
vnoremap p "_dp

" Easier indentation
vnoremap - <gv
vnoremap = >gv

" Insert mode navigation in insert mode
inoremap <C-l> <Esc>2li
inoremap <C-h> <Esc>2hi
inoremap <C-k> <Esc>kli
inoremap <C-j> <Esc>jli

" Start newline without entering insert mode and maintains cursor position
map <CR> m`o<Esc>``
map <S-CR> m`i<CR><ESC>``

"--  Method text objects operation replacement
nnoremap vam j:action MethodUp<cr>0v]M
nnoremap vim j:action MethodUp<cr>f{vi{
nnoremap yam j:action MethodUp<cr>0v]My
nnoremap yim j:action MethodUp<cr>f{yi{
nnoremap dam j:action MethodUp<cr>0v]M"_d
nnoremap dim j:action MethodUp<cr>"_di{
nnoremap cam j:action MethodUp<cr>0v]M"_c
nnoremap cim j:action MethodUp<cr>f{"_ci{

"--  Class motions
nnoremap viC gg :action MethodDown<cr>f{vi{ 
nnoremap vaC gg :action MethodDown<cr>f{va{V
nnoremap yiC gg :action MethodDown<cr>f{yi{ 
nnoremap yaC gg :action MethodDown<cr>f{va{Vy
nnoremap diC gg :action MethodDown<cr>f{"_di{ 
nnoremap daC gg :action MethodDown<cr>f{va{V"_d
nnoremap ciC gg :action MethodDown<cr>f{"_ci{ 
nnoremap caC gg :action MethodDown<cr>f{va{V"_c
" nnoremap őc :call search('\<class\>', 'bW')<cr> ^ 
" nnoremap úc :call search('\<class\>', 'W')<cr> ^ 
" nnoremap őC :call search('\<class\>', 'bW')<cr> f{% 
" nnoremap úC :call search('\<class\>', 'W')<cr> f{% 

" Better code navigation
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Forward/Back
map <C-o> <Action>(Back)
map <C-i> <Action>(Forward)

" Switch to split by direction
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Method movement
map <C-S-p> <Action>(MethodUp)
map <C-S-n> <Action>(MethodDown)

" Move code using h/j/k/l rather than IntelliJ's keybindings that uses arrow keys
map <C-S-h> <Action>(MoveElementLeft)
map <C-S-l> <Action>(MoveElementRight)
map <C-S-j> <Action>(MoveStatementDown)
map <C-S-k> <Action>(MoveStatementUp)

" Select file in project view
let g:WhichKeyDesc_select_in_project_view_                                                   = "<leader>1"
map <leader>1 <Action>(SelectInProjectView)

" Clear search highlight
let g:WhichKeyDesc_no_highlight                                                              = "<leader>n"
nnoremap <leader>n :nohlsearch<CR>

" Quick docoumentation
nmap K <Action>(QuickJavaDoc)
