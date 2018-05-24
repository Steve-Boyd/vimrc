execute pathogen#infect()

syntax on
filetype on
set number
set hidden
set history=100
set hlsearch
set showmatch
set updatetime=250
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

colorscheme Tomorrow-Night-Eighties
let mapleader=" "
inoremap jj <esc>

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

""""" Lightline """""
"" Bottom bar ""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
set noshowmode

if !has('gui_running')
  set t_Co=256
endif

""""" End Lightline """""

""""" Airline theme """""
"" Vim color theme ""
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
"""" end Airline theme """"

""""" Nerdtree """""
"" Tree explorer ""
"autocmd VimEnter * NERDTree "auto open nerdtree
autocmd VimEnter * wincmd p

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

map <Leader>n :NERDTreeToggle<CR>
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

"""" Ctrlp """"
"" Fuzzy searching ""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"""" end Ctrlp """"

"""" Vim-fugitive """"
"" Add git functionality to vim. Map git status, blame, and diff commands ""
nmap     <Leader>gs :Gstatus<CR>gg<c-n>
nnoremap <Leader>gd :Gdiff<CR>
nmap     <Leader>gb :Gblame<CR>gb<c-n>
"""" end Vim-fugitive """"

