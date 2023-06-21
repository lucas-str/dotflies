"let g:ale_lint_on_insert_leave = 0
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

let g:ale_cpp_flawfinder_minlevel = 3
let g:ale_c_flawfinder_minlevel = 3

let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_autopep8_options = '-a'

let g:ale_rust_cargo_use_clippy = 1

let g:ale_fixers = {
\    '*': ['trim_whitespace'],
\    'go': ['gofmt', 'goimports'],
\    'python': ['black', 'isort'],
\    'groovy': ['npm-groovy-lint'],
\}

let g:ale_python_isort_options = '--profile black'

let g:ale_linters_ignore = {
\    'c': ['clangd'],
\    'python': ['pyright'],
\}

nmap gd <Plug>(ale_go_to_definition)
nmap gD <Plug>(ale_go_to_type_definition)

imap <C-Space> <Plug>(ale_complete)
