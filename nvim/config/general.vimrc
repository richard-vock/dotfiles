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
" .swp go into /tmp
set directory=/tmp,.

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

" make
"set makeprg=scons\ -j\ 12
set makeprg=ninja\ -j\ 12
":command -nargs=* Make make <args> | cwindow 8
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"map <F7> :CMakeInstall<CR>

" popuo menu background
highlight Pmenu ctermbg=232
