" Basic Configs
syntax on
filetype plugin indent on
set nu rnu ts=4 sts=4 sw=4 et ai si
set ignorecase smartcase

" Enable Spell Checking
" set spell
" set spelllang=en_us

" Search Settings
set hlsearch
set incsearch
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Tabs and Window Management
set showtabline=1
set laststatus=0
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprev<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" Clipboard Mappings
nnoremap ^ ggVG
vnoremap <Space>y "+y
nnoremap <Space>p "+P

" Mouse Settings
set mouse=a

" Auto-Save and Code Run Bindings
set autowrite
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!clear; python3 %<CR>
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!clear && mkdir -p compiled_code && cc % -o compiled_code/%:r && compiled_code/%:r<CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!clear && mkdir -p compiled_code && g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result % -o compiled_code/%:r && compiled_code/%:r<CR>

" Cursor Settings
set ttimeout ttimeoutlen=0
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" Backspace Behavior
set backspace=indent,eol,start

" Text Wrapping
set wrap linebreak

" Plugin Manager
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

" Theme and Colors
set termguicolors
set background=dark
colorscheme torte

" Utility Mappings
nnoremap <silent> <F9> :%s/\s\+$//e<Bar>echo "Trailing whitespaces removed"<CR>
nnoremap <F7> :FZF ~<CR>
