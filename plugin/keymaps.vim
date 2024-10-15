inoremap <C-CR> <C-o>o
inoremap <S-CR> <C-o>O
nnoremap + :res +5<cr>
nnoremap _ :res -5<cr>
nnoremap > :vertical resize +5<cr>
nnoremap < :vertical resize -5<cr>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
