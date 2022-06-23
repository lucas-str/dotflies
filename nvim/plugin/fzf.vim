nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nnoremap <Leader>t :Windows<CR>
let g:fzf_action = {
\    'enter': 'drop',
\    'ctrl-t': 'tab drop',
\    'ctrl-x': 'split',
\    'ctrl-v': 'vsplit',
\}
