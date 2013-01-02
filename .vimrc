" Seth Larson's vimrc
call pathogen#runtime_append_all_bundles()

set nocompatible
set hidden
set history=10000
set shell=bash
set ignorecase smartcase
set cursorline
set expandtab
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set winwidth=79
set showtabline=2 "always display the tabline
set showcmd
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildmode=longest,list
set wildmenu
autocmd FileType make setlocal noexpandtab
syntax on
let mapleader=","

" Colors
:set t_Co=256
:set background=dark 

""""""""""""""
" Key bindings
""""""""""""""
imap <c-l> <space>=><space>
imap <c-c> <esc>
:nnoremap <CR> :nohlsearch<cr>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
""""""""""""""""""""""
" Multipurpose Tab Key
""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

"""""""""""""""""
" Training Wheels
"""""""""""""""""
map <Left> :echo "Surely you meant h"<cr>
map <Right> :echo "Surely you meant l"<cr>
map <Up> :echo "Surely you meant k"<cr>
map <Down> :echo "Surely you meant j"<cr>

"""""""""""""
" Rename File
"""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent ~rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>


