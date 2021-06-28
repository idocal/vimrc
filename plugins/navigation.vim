nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <C-q> :call ToggleQF()<CR>

let g:qf = 0
fun! ToggleQF()
    if g:qf == 1
        let g:qf = 0
        cclose
    else
        let g:qf = 1
        copen
    end
endfun
