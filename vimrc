execute pathogen#infect()
syntax on
filetype on
set number

colorscheme Tomorrow-Night-Eighties
let mapleader=" "
map <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

" autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
set showmatch

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
