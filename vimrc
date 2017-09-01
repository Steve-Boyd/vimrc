execute pathogen#infect()

syntax on
filetype on

set number
set hidden
set history=100
set hlsearch
set showmatch

""""" Lightline """""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif
""""" End Lightline """""

""""" Nerdtree """""

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
nmap <leader>j :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! MyLightLinePercent()
  if &ft !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction
function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

let g:lightline.component_function = {
  \ 'percent': 'MyLightLinePercent',
  \ 'lineinfo': 'MyLightLineLineInfo'
  \ } 

""""" End Nerdtree """""

colorscheme Tomorrow-Night-Eighties
let mapleader=" "

" reload vimrc settings on save
map <leader>s :source ~/.vimrc<CR>

map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

" remove whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e

" reopen previously opened file
" nnoremap <Leader><Leader> :e#<CR>

""""" Command-T """""
" ignore these files when searching
set wildignore+=*.log,*.sql,*.cache

" reindex files after new ones have been added with <Leader>+r
noremap <Leader>r :CommandTFlush<CR>
""""" End Command-T """""

""""" Nerdcommenter """""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
""""" End Nerdcommenter """""
