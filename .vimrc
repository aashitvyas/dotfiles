set number
set backspace=indent,eol,start
set ruler
set encoding=utf-8
set clipboard=unnamed
set nocompatible
" set spell spelllang=en_us
filetype plugin indent on
syntax on



call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']

"https://github.com/tpope/vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s



"Fixing youcompleteme 
let g:ycm_global_ycm_extra_conf = "/Users/ashit.vyas/.vim/plugged/youcompleteme/third_party/ycmd/.ycm_extra_conf.py"

"https://github.com/hashivim/vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

"To use fzf in Vim, add the following line to your .vimrc:
set rtp+=/usr/local/opt/fzf


autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
