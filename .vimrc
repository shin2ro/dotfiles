set nocompatible

set encoding=utf-8
set fileformat=unix

set noswapfile
set nobackup
set noundofile

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set clipboard=unnamed

set laststatus=2

" dein.vim
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('Shougo/dein.vim')
  call dein#add('cocopon/iceberg.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('mechatroner/rainbow_csv')
  call dein#add('rust-lang/rust.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" lightline.vim
let g:lightline = { 'colorscheme': 'iceberg' }

augroup file_type_indent
    autocmd!
    autocmd BufNewFile,BufRead *.yml setlocal ts=2 sts=2 sw=2
augroup END

augroup binary_xxd
    autocmd!
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r
    autocmd BufWritePre * endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

