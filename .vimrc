"Vimの基本設定================================
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"Vi互換をオフ
set nocompatible
"UTF-8
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8


"タブセット===================================
"シフト移動幅
set shiftwidth=2
"タブの代わりに空白文字を挿入する
set expandtab
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number


"検索補助=====================================
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"検索をファイルの先頭へループしない
set nowrapscan
"インクリメンタルサーチを行う
set incsearch
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" ヘルプを引きやすくする
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><CR>


"入力補助=====================================
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行のインデントを現在行と同じにする
set autoindent
"Escapeを<C-[>にする
inoremap <C-[> <ESC>
"括弧等を補完する
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
"<C-k>した場合は、２行分改行して、間の行から入力する
inoremap <C-c> <CR><CR><UP><TAB>
"挿入モードでカーソル移動
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
"挿入モードで行末に移動
inoremap <C-e> <End>
"挿入モードでカーソル上の文字をデリート
inoremap <C-d> <Del>
"vspの画面分割で左右画面を入れ替える => 誤動作が多い...
"nnoremap <C-l> <C-w>L

"4HTML=======================================
inoremap <div <div><CR></div><UP>
inoremap <html <html><CR><CR></html><UP><TAB>
inoremap <head <head><CR><CR></head><UP><TAB>
inoremap <body <body><CR><CR></body><UP><TAB>

"4Ruby=======================================
"input erb keybind
inoremap <C-F> <% %><LEFT><LEFT><LEFT>


"MacVimGUI用=================================
" if has('gui_macvim')
"       set showtabline=2 " タブを常に表示
"       set imdisable " IMを無効化
"       set transparency=5 " 透明度を指定
"       set antialias
"       set guifont=Monaco:h14
"       colorscheme macvim
"       set nobackup
" endif

" if has("gui_running")
"       set fuoptions=maxvert,maxhorz
"       au GUIEnter * set fullscreen
" endif

