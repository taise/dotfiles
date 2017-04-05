call plug#begin('~/.vim/plugged')

Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/opsplorer'
Plug 'Shougo/vimfiler'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'

Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'vim-scripts/javacomplete'
Plug 'derekwyatt/vim-scala'
Plug 'jiangmiao/simple-javascript-indenter'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'JuliaLang/julia-vim'
Plug 'fatih/vim-go'
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'modsound/macdict-vim'

Plug 'wakatime/vim-wakatime'
Plug 'leafgarland/typescript-vim'
call plug#end()

filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells

"backup
set nowritebackup
set nobackup
set noswapfile
set hidden

"UTF-8
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set ambiwidth=double

"show invisibility mark
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=eol:$,tab:>\ ,extends:<
set colorcolumn=80

"syntax hilight
set background=dark
colorscheme darkblue


"set tab
set expandtab
set tabstop=2
set smarttab
set shiftwidth=2

set nowrap
set whichwrap=b,s,h,l,<,>,[,]

"decorate
set number
set showmatch
set matchpairs& matchpairs+=<:>
set cursorline
set completeopt=menu,preview

"search
set ignorecase
set smartcase
set nowrapscan
set incsearch
set hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

"indent
set smartindent
set autoindent

"select
vnoremap v $h

"custom key binds
inoremap <C-[> <ESC>
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

nnoremap H ^
nnoremap J }
nnoremap K {
nnoremap L $

inoremap <C-e> <End>
inoremap <C-d> <Del>

"useful backspace
set backspace=indent,eol,start

"input erb keybind
inoremap <C-F> <% %><LEFT><LEFT><LEFT>

"Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file buffer<CR>

"QuickRun
let g:quickrun_config = {}
" for Rspec
let g:quickrun_config['ruby.rspec'] = {'command': 'bundle exec rspec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" for Go
let g:go_fmt_command = "goimports"

" set color for Indent Guides
" indent-guides on
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" set complete for jscomplete-vim
let g:jscomplete_use = ['dom', 'es6']

" java syntax highlight
let java_highlight_all=1

"Vim command
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" SyntasticCheck
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'passive_filetypes': ['python', 'ruby']
            \ }

" set lightline
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '＞', 'right': '＜' },
      \ 'subseparator': { 'left': '>', 'right': '<' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '🔒' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '@'._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 60 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 60 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 50 ? lightline#mode() : ''
endfunction


" for VimFiler
nnoremap <silent> ,vf :<C-u>VimFiler -split -simple -winwidth=30 -no-quit<CR>
let g:vimfiler_as_default_explorer = 1

" for Tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

nmap <C-_> :TagbarToggle<CR>
nmap <C-p> :set paste<CR>

" smart paste
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
