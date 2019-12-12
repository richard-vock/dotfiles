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
