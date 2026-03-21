" .vimrc

" Appearance
syntax on
set termguicolors
set background=dark
colorscheme torte
set nu rnu
set laststatus=0
set showtabline=1
set wrap linebreak
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" Logic
filetype plugin indent on
set mouse=a
set ignorecase smartcase
set hlsearch incsearch
set autowrite
set hidden
set backspace=indent,eol,start
set ttimeout ttimeoutlen=0
set ts=4 sts=4 sw=4 et ai si

" Spell
" set spell
" set spelllang=en_us

" Bindings
let mapleader = " "
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>
nnoremap ^ ggVG
vnoremap <Leader>y "+y
nnoremap <Leader>p "+P
nnoremap <F7> :FZF ~<CR>
nnoremap <silent> <F9> :%s/\s\+$//e<Bar>echo "Cleaned"<CR>

" Tabs
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprev<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" Compilers
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!clear; python3 %<CR>
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!clear && mkdir -p compiled && cc % -o compiled/%:r && ./compiled/%:r<CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!clear && mkdir -p compiled && g++ -std=c++17 -Wshadow -Wall -O2 % -o compiled/%:r && ./compiled/%:r<CR>

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug '/usr/share/doc/fzf/examples'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'
call plug#end()
