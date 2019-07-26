let PLUGIN_LIST = []

nnoremap <F2> :set invpaste paste?<CR>
nnoremap <C-space> <C-p>
set pastetoggle=<F2>
inoremap <C-v> <F2><C-r>+<F2>
set showmode

" let filelist = glob("~/.vimrc.d/*")
" let filelist = split(filelist, "\n")
" for file in filelist
" 	source file
" endfor
source ~/.vimrc.d/formater.vim
source ~/.vimrc.d/markdown.vim
source ~/.vimrc.d/alias.vim
source ~/.vimrc.d/indent.vim
source ~/.vimrc.d/color.vim
source ~/.vimrc.d/completion.vim
source ~/.vimrc.d/commentout.vim
" source ~/.vimrc.d/html_css.vim


"-------------------------------------------------------------------------------
" Vundle init
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
  Plugin 'leafgarland/typescript-vim'
  " Plugin 'vim-ctrlspace/vim-ctrlspace'
	for plugin in PLUGIN_LIST
		Plugin plugin
	endfor
call vundle#end()
filetype plugin indent on

