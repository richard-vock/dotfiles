" general
set nocp
filetype plugin on

let &titlestring = @%
"let &titlestring = expand('%:p')
set title

set clipboard=unnamedplus

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

" gui
set number
set guioptions-=t
set guioptions-=T
set guioptions-=m
set guioptions+=M
set hlsearch
:autocmd InsertEnter,InsertLeave * set cul!

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
:map <F1> zR
:map <F2> zM
:map <F3> zr

:map <F4> :cclose<CR>:bd<CR>

:map <F5> mA
:map <F6> `A

" .swp go into /tmp
set directory=/tmp,.

" make
"set makeprg=scons\ -j\ 12
set makeprg=ninja\ -j\ 12
":command -nargs=* Make make <args> | cwindow 8
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"map <F7> :CMakeInstall<CR>
map <F7> :update<CR>:cclose<CR>:make -C build install<CR>
map <F8> :cclose<CR>
map <F9> :update<CR>:cclose<CR>:make -C build<CR>
"map <F10> :w<CR>:!build/test -v<CR>
map <F10> :update<CR>:!cd build && ninja clean && ninja<CR>
"map <F11> :CMakeCreateBuild build<CR>

:set hidden

map <C-Space> :bn<CR>
map <C-BS> :bp<CR>
map <C-@> :bn<CR>
map <C-H> :bp<CR>
map <C-TAB> <C-w>p
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
map <Space> @q

map <Insert> "*p

map J <C-d>
map K <C-u>

" leader binding
" let mapleader = "ü"
map ä :w<CR>:A<CR>
map Ä :A<CR>
"map <Leader>c :bd<CR>

" searching - make backward search search forward
map # *

map <Leader>b :pyf /usr/share/clang/clang-format.py<CR>
map <Leader><Leader>b ggVG:pyf /usr/share/clang/clang-format.py<CR>


" syntaxhighlighting
syntax on
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.cu set syntax=cuda
au BufNewFile,BufRead *.cuh set syntax=cuda
"au BufNewFile,BufRead *.frag set syntax=cpp11
"au BufNewFile,BufRead *.vert set syntax=cpp11
au BufNewFile,BufRead *.cl setf opencl
au BufNewFile,BufRead SCons* set filetype=scons

set modelines=1

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_pylint_args = "--errors-only"

let g:tcomment_opleader1 = '<Leader>c'

" LanguageClient-neovim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/a.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
"Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'takac/vim-hardtime'
Plug 'nanotech/jellybeans.vim'
"Plug 'Shougo/deoplete.nvim'

call plug#end()

colorscheme jellybeans


let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ }

"let g:LanguageClient_serverCommands = {
    "\ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    "\ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    "\ 'cu': ['cquery', '--log-file=/tmp/cq.log'],
    "\ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/slim/.config/nvim/settings.json'
let g:LanguageClient_diagnosticsSignsMax = 0
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F11> :call LanguageClient#textDocument_rename()<CR>

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'jellybeans'

let g:alternateNoDefaultAlternate = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.local/share/nvim/snippets"

let g:EasyMotion_do_mapping = 0
"let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap s <Plug>(easymotion-overwin-f)
nmap f <Plug>(easymotion-overwin-f2)
nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

"map <Leader>c <Plug>NERDCommenterToggle

"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#source('LanguageClient',
            "\ 'min_pattern_length',
            "\ 2)

"augroup LanguageClient_config
"  au!
"  au BufEnter * let b:Plugin_LanguageClient_started = 0
"  au User LanguageClientStarted setl signcolumn=yes
"  au User LanguageClientStarted let b:Plugin_LanguageClient_started = 1
"  au User LanguageClientStopped setl signcolumn=auto
"  au User LanguageClientStopped let b:Plugin_LanguageClient_stopped = 0
"  au CursorMoved * if b:Plugin_LanguageClient_started | call LanguageClient_textDocument_hover() | endif
"augroup END

let g:hardtime_default_on = 1
