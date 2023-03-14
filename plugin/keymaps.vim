nnoremap <expr> <CR> { -> v:hlsearch ? ":nohl\<CR>" : "\<CR>" }()

" Open line below or above the current line
inoremap <C-CR> <C-o>o
inoremap <S-CR> <C-o>O

" Set virtual or horizontal split
nnoremap ,h <C-w>K
nnoremap ,v <C-w>H

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Map local marks to global
nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap mf mF
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D
nnoremap 'f 'F

" Terminal mappings
" Leave terminal mode
tnoremap <leader><esc> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>

" Move between buffers
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-n> :cnext<cr>
nnoremap <C-p> :cprev<cr>
