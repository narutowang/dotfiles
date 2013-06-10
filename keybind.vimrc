" expand dir path
cmap <C-x> <c-r>=expand('%:h')<CR>/
" expand file path
cmap <C-z> <c-r>=expand('%')<CR>
" paste in command mode
cmap <C-y> <C-r>"
" コマンドモード時にカーソル移動を emacs 形式にする
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>

" Tabでバッファ移動
nmap <Tab> :bnext \| redraw<CR>
nmap <S-Tab> :bprev \| redraw<CR>

" レジスタの内容を置き換えずにペースト
" I haven't found how to hide this function (yet)
function! RestoreRegister()
	let @" = s:restore_reg
	return ''
endfunction
function! s:Repl()
	let s:restore_reg = @"
	return "p@=RestoreRegister()\<cr>"
endfunction
" NB: this supports "rp that replaces the selection by the
" contents of @r
vnoremap <silent> <expr> =p <sid>Repl()

"インサートモード時のキーバインドをemacs風にする
" カーソル移動
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-d> <Del>
" カーソルのある行を画面中央に
inoremap <C-l> <C-o>zz
" カーソルより前の文字を削除
inoremap <C-u> <C-o>d0
" カーソルより後の文字を削除
inoremap <C-k> <c-o>D
" アンドゥ（「C-_」は「Ctrl+/」を意味する）
inoremap <C-_> <C-o>u
" 貼りつけ
inoremap <C-y> <C-o>P

" \eキーでファイルタイプにあったインタプリタを実行
au Filetype ruby       nnoremap <buffer><leader>e :!ruby %<Return>
au Filetype perl       nnoremap <buffer><leader>e :!perl %<Return>
au Filetype haskell    nnoremap <buffer><leader>e :!runghc %<Return>
au Filetype scheme     nnoremap <buffer><leader>e :!gosh %<Return>
au Filetype javascript nnoremap <buffer><leader>e :!js %<Return>
au Filetype vim        nnoremap <silent><leader>e :source %<Return>

