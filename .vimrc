" backup
set backupdir=$HOME/vimbackup
set browsedir=buffer 
set directory=$HOME/vimbackup

set hidden
set nocompatible

"UTF-8
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8


" set tab
set shiftwidth=2
set expandtab
set list
set listchars=eol:$,tab:>\ ,extends:<

set number
syntax on
filetype on
filetype indent on
filetype plugin on
"set t_Co=256

"set clipboard=unnamed

" search
set smartcase
set nowrapscan
set incsearch

set smarttab
set tabstop=2
set whichwrap=b,s,h,l,<,>,[,]
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>


" utility for input
set smartindent
set showmatch
set autoindent
" set ESC to Ctrl + [
inoremap <C-[> <ESC>
" backspace
set backspace=indent,eol,start

inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>

inoremap <C-c> <CR><CR><UP><TAB>

inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>

inoremap <C-e> <End>
inoremap <C-d> <Del>

"4HTML
inoremap <div <div><CR></div><UP>

"4Ruby
"input erb keybind
inoremap <C-F> <% %><LEFT><LEFT><LEFT>

