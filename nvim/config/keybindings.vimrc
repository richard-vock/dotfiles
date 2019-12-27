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

map J }
map K {

" searching - make backward search search forward
" map # *

map <F1> zR
map <F2> zM
map <F3> zr

map <F4> :cclose<CR>:bd<CR>

map <F5> mA
map <F6> `A
map <F7> :update<CR>:cclose<CR>:make -C build install<CR>
map <F8> :cclose<CR>
map <F9> :update<CR>:cclose<CR>:make -C build<CR>
"map <F10> :w<CR>:!build/test -v<CR>
map <F10> :update<CR>:!cd build && ninja clean && ninja<CR>
"map <F11> :CMakeCreateBuild build<CR>
