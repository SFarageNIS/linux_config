set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Syntastic'
Plugin 'The-NERD-tree'

call vundle#end()  " required
filetype plugin indent on    " required

"indentation stuff
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" auto reload changes
set autoread

" dictionary autocomplete
set complete+=k

" view line numbers
set number

" colors
highlight LineNr ctermfg=grey
colorscheme codedark

" whitespace action
set listchars=tab:▸▸,trail:~
set list

" toggle nerdtree via F2
:nmap <F2> :NERDTreeToggle<CR>

" close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
