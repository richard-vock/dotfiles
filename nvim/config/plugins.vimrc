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
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'takac/vim-hardtime'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/goyo.vim'
Plug 'will133/vim-dirdiff'
"Plug 'Shougo/deoplete.nvim'

call plug#end()
