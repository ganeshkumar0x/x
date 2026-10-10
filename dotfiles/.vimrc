" .vimrc

set nocompatible
syntax on
filetype plugin indent on

set termguicolors
set background=dark
colorscheme pablo
set number relativenumber
set wrap linebreak

set ignorecase smartcase
set hlsearch incsearch

set hidden
set backspace=indent,eol,start
set ttimeout ttimeoutlen=0
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

nnoremap <silent> <Esc> :nohlsearch<CR>
nnoremap <silent> <F9> :keeppatterns %s/\s\+$//e<Bar>echo "Cleaned"<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git"'
