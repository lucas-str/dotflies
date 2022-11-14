nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nnoremap <Leader>t :Windows<CR>
let g:fzf_action = {
"\    'enter': 'drop',
\    'ctrl-t': 'tab drop',
\    'ctrl-x': 'split',
\    'ctrl-v': 'vsplit',
\}
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!{.git,tmpenv}/*" --glob "!tags" 2>/dev/null'
endif
