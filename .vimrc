set encoding=utf-8
set backspace=indent,eol,start
set number
syntax on

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'neoclide/coc.nvim'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'preservim/nerdcommenter'
Plugin 'airblade/vim-gitgutter'

"Plugin 'fatih/vim-go'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
nnoremap <C-h> :Rg<Cr>
"nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <C-f> :Rg <C-R><C-W><CR>

" Lightline
set laststatus=2

" coc-vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
