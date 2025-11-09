" Basic Configs
syntax on
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set rnu noshowmode ignorecase smartcase

" Enable Spell Checking
set spell
set spelllang=en_us

" Disable search highlight but keep incremental search
set nohlsearch
set incsearch

" Tabs and Window Management
set showtabline=2
nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprev<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" Clipboard and select-all mappings
nnoremap ^ ggVG
vnoremap <Space>y "+y
nnoremap <Space>p "+P

" Mouse Settings
set mouse=a mousehide

" Auto-Save and Code Run Bindings
set autowrite
autocmd FileType python nnoremap <F5> :w<CR>:!clear; python3 %<CR>
autocmd FileType c nnoremap <F5> :w<CR>:!clear && mkdir -p compiled_code && cc % -o compiled_code/%:r && compiled_code/%:r<CR>
autocmd FileType cpp nnoremap <F5> :w<CR>:!clear && mkdir -p compiled_code && g++ -std=c++17 -Wshadow -Wall -O2 -Wno-unused-result % -o compiled_code/%:r && compiled_code/%:r<CR>

" Cursor Shape Settings for GUI Support
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
set ttimeout ttimeoutlen=0 ttyfast

" Backspace Behavior
set backspace=indent,eol,start

" Vim-Plug Bootstrap
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Themes
set termguicolors
set background=dark
colorscheme sorbet

" Transparency
hi Normal        ctermbg=NONE guibg=NONE
hi NonText       ctermbg=NONE guibg=NONE
hi LineNr        ctermbg=NONE guibg=NONE
hi CursorLineNr  ctermbg=NONE guibg=NONE
hi SignColumn    ctermbg=NONE guibg=NONE
hi VertSplit     ctermbg=NONE guibg=NONE
hi StatusLine    ctermbg=NONE guibg=NONE
hi StatusLineNC  ctermbg=NONE guibg=NONE
hi TabLine       ctermbg=NONE guibg=NONE
hi TabLineFill   ctermbg=NONE guibg=NONE
" hi TabLineSel    ctermbg=NONE guibg=NONE
hi Folded        ctermbg=NONE guibg=NONE
" hi Pmenu         ctermbg=NONE guibg=NONE
" hi PmenuSel      ctermbg=NONE guibg=NONE
" hi PmenuSbar     ctermbg=NONE guibg=NONE
" hi PmenuThumb    ctermbg=NONE guibg=NONE
hi NormalFloat   ctermbg=NONE guibg=NONE
hi FloatBorder   ctermbg=NONE guibg=NONE
" hi Visual        ctermbg=NONE guibg=NONE
hi CursorLine    ctermbg=NONE guibg=NONE
hi IncSearch     ctermbg=NONE guibg=NONE
hi Search        ctermbg=NONE guibg=NONE

" Trailing Whitespace Removal
nnoremap <silent> <F9> :%s/\s\+$//e<Bar>echo "Trailing whitespaces removed"<CR>

" CtrlP Settings
let g:ctrlp_map = '<F7>'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
let g:ctrlp_full_path = 1
nnoremap <F7> :CtrlP<CR>
