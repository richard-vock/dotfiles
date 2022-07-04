set nocp
filetype plugin on

let &titlestring = @%
"let &titlestring = expand('%:p')
set title

set clipboard=unnamedplus
set modelines=1

" code display
set modelines=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nowrap
set backspace=2
set cindent

"autocmd Filetype haskell setlocal ts=4 sts=4 sw=4 expandtab
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set number
" .swp folder
"set directory^=/home/slim/.local/share/nvim/swap//
set noswapfile

:set hidden

set hlsearch
" toggle line highlight based on insert/normal mode
:autocmd InsertEnter,InsertLeave * set cul!

" syntaxhighlighting
syntax on
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.cu set syntax=cuda
au BufNewFile,BufRead *.cuh set syntax=cuda
"au BufNewFile,BufRead *.frag set syntax=cpp11
"au BufNewFile,BufRead *.vert set syntax=cpp11
au BufNewFile,BufRead *.cl setf opencl
au BufNewFile,BufRead SCons* set filetype=scons

" set folding to syntax mode (assumes c++) and bind
set foldmethod=syntax
set foldcolumn=4
au BufNewFile,BufRead *.py
    \ set foldmethod=indent |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" popuo menu background
highlight Pmenu ctermbg=232

set diffopt+=internal,algorithm:patience

let g:vim_json_conceal=0
