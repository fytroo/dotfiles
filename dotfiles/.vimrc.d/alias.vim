"-------------------------------------------------------------------------------
" Edit .sh
"-------------------------------------------------------------------------------
autocmd FileType sh :noremap R :.w !$SHELL<Return>

"-------------------------------------------------------------------------------
" Enable alias.sh
"-------------------------------------------------------------------------------
set shell=/bin/bash\ -l\ -O\ expand_aliases


"-------------------------------------------------------------------------------
" Split window
"-------------------------------------------------------------------------------
" split window
nmap vs :vsplit<Return><C-w>w

"-------------------------------------------------------------------------------
" Move window
"-------------------------------------------------------------------------------
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"-------------------------------------------------------------------------------
" Resize window
"-------------------------------------------------------------------------------
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"-------------------------------------------------------------------------------
" Save
"-------------------------------------------------------------------------------
nmap W :w

"-------------------------------------------------------------------------------
" Linebreak
"-------------------------------------------------------------------------------
" nnoremap K i<CR><Esc>
map K i<Enter><Esc>