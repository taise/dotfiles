" for neo bundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/opsplorer'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'

" for Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

" for Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'

NeoBundle 'othree/html5.vim'

NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'derekwyatt/vim-scala'

" for JavaScript
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
"NeoBundle 'teramako/jscomplete-vim'

" for Julia
NeoBundle 'JuliaLang/julia-vim'

" for Python
let $PATH = "~/.pyenv/shims:".$PATH"
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"],
      \ },
      \ "build": {
      \   "mac": "pip install jedi",
      \   "unix": "pip install jedi",
      \ }}
"NeoBundle 'kevinw/pyflakes-vim'

" for Markdown
NeoBundle 'joker1007/vim-markdown-quote-syntax'
" for Dictionary
NeoBundle 'modsound/macdict-vim'


filetype plugin indent on
filetype indent on
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

"show invisibility mark
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=eol:$,tab:>\ ,extends:<
set colorcolumn=80

"syntax hilight
set background=dark
colorscheme darkblue


"set tab
set tabstop=2
set smarttab
set shiftwidth=2

set expandtab
set nowrap
set whichwrap=b,s,h,l,<,>,[,]

"decorate
set number
""set colorcolumn=80
set showmatch
set matchpairs& matchpairs+=<:>
set cursorline

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
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"QuickRun
let g:quickrun_config = {}
" for Rspec
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END


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
let g:syntastic_python_python_exec = '/Users/taise/.pyenv/shims/python3'
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'passive_filetypes': ['python', 'ruby']
            \ }

" jedi
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType python setlocal completeopt-=preview
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

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
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
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
    return strlen(_) ? '⭠ '._ : ''
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
