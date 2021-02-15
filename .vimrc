" vim-plug 
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sickill/vim-monokai',
Plug 'scrooloose/nerdtree',
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim',
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdcommenter',
Plug 'airblade/vim-gitgutter',
Plug 'liuchengxu/vista.vim'

" For python
" Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' },

" For Golang
" Plug 'josa42/coc-go'
" Plug 'fatih/vim-go'


" Initialize plugin system
call plug#end()

set encoding=utf-8
set backspace=indent,eol,start
set number
syntax on
set nocompatible              " required
filetype off                  " required
filetype plugin indent on    " required

"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

" scrooloose/nerdtree config
map <C-o> :NERDTreeToggle<CR>
"autocmd vimenter * NERDTree
filetype plugin on

" sickill/vim-monokai config
colorscheme monokai

" vim-go config
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_version_warning = 0

" Enable folding
set foldmethod=indent
set foldlevel=99


" Map Rg search to Ctrl-G
nnoremap <C-g> :Rg<Cr>
"nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <C-f> :Rg <C-R><C-W><CR>

" Lightline
set laststatus=2

" coc-vim
let g:coc_disable_startup_warning = 1
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
