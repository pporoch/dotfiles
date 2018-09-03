set number "Display line number
set title "Display file name
set showmatch "Display pair bracket
syntax on
set tabstop=2 "Indent using spaces 2
set smartindent "Autoindent

set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp

set ignorecase "Not case sensitive
set smartcase "If capital letters are included, distinguish it
set wrapscan "When searching, return from the end to the begining

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
