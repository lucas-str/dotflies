func! GodotSettings() abort
    setlocal noexpandtab
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
endfunc
augroup godot | au!
    au Filetype gdscript call GodotSettings()
augroup end
