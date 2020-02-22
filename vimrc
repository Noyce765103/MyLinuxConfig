let mapleader=" "
syntax on
set number
set cursorline
set wrap
set wildmenu
set showcmd
set hlsearch
exec  "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
let &t_SI="\<Esc>]50;CursorShape=1\x7"
let &t_SR="\<Esc>]50;CursorShape=2\x7"
let &t_EI="\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


noremap <LEADER><CR> :nohlsearch<CR>
noremap <LEADER>b :Autoformat<CR>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map sr :set splitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map <LEADER>w <C-w>k
map <LEADER>s <C-w>j
map <LEADER>a <C-w>h
map <LEADER>d <C-w>l
map <LEADER>j :res +5<CR>
map <LEADER>k :res -5<CR>
map <LEADER>h :vertical resize-5<CR>
map <LEADER>l :vertical resize+5<CR>
map <C-t> :term<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-vividchalk'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme' 
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'connorholyday/vim-snazzy'
call plug#end()

colorscheme snazzy
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }

highlight ALEWarning ctermbg=red
nmap <silent> <C-a> <Plug>(ale_previous_wrap)
nmap <silent> <C-d> <Plug>(ale_next_wrap)
map ss :NERDTreeToggle<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ -g % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ -g % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 

set clipboard=unnamed

