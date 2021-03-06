" Character code
set encoding=utf-8 " At file reading
scriptencoding utf-8 " Vim script file using multibyte characters

" 以下、日本語（マルチバイト文字）使用可

" 文字コード
set fileencoding=utf-8 " 保存時
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jisx0213,euc-jp,sjis,guess " 読込み時の自動判別
set ambiwidth=double " □や○文字、三点リーダ等の表示問題解決
set fileformats=unix,dos,mac " 改行コードの自動判別

""""""""""""""""""""""""""""""
" vim-plugのインストール
""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'Shougo/unite.vim' " ファイルオープンを便利に
  Plug 'Shougo/neomru.vim' " unite.vimで file_mruを使うのに必要
  Plug 'scrooloose/nerdtree' " ディレクトリをtree表示
  Plug 'nathanaelkane/vim-indent-guides' " インデントを見やすく
  Plug 'kana/vim-smartchr' " キー入力補助
  Plug 'tpope/vim-fugitive' " vim上でGitを使う
"  Plug 'Shougo/deoplete.nvim' " 強力な入力補完
"  Plug 'roxma/nvim-yarp' " vim8でdeoplete.nvimを使うのに必要
"  Plug 'roxma/vim-hug-neovim-rpc' " vim8でdeoplete.nvimを使うのに必要
"  Plug 'Shougo/neco-syntax' " deoplete.nvim用ソースプラグイン
" [deoplete.nvim用ソースプラグイン一覧](https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources)
call plug#end()
""""""""""""""""""""""""""""""
" プラグインのオプション
""""""""""""""""""""""""""""""
" unite.vim オプション
let g:unite_enable_start_insert = 1 " 起動時にインサートモードで開始
nnoremap <silent> <C-h> :<C-u>Unite file_mru<CR> " ノーマル:<C-h>で履歴一覧
inoremap <silent> <C-h> <ESC>:<C-u>Unite file_mru<CR> " インサート:<C-h>で履歴一覧
nnoremap <silent> <C-b> :<C-u>Unite buffer<CR> " ノーマル:<C-b>でバッファ一覧
inoremap <silent> <C-b> <ESC>:<C-u>Unite buffer<CR> " インサート:<C-b>でバッファ一覧
autocmd FileType unite call s:unite_my_settings() " unite.vim上でのキーマッピング
function! s:unite_my_settings()
  nmap <silent><buffer> <ESC><ESC> q " ノーマル:ESCキー2回押しで終了
  imap <silent><buffer> <ESC><ESC> <ESC>q " インサート:ESCキー2回押しで終了
endfunction
""""""""""""""""""""""""""""""
" nerdtree オプション
map <C-d> :NERDTreeToggle<CR> " Ctrl + d でディレクトリツリーのトグル表示
""""""""""""""""""""""""""""""
" vim-indent-guides オプション
let g:indent_guides_enable_on_vim_startup = 1 " 自動有効
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
""""""""""""""""""""""""""""""
" vim-smartchr オプション
inoremap <buffer> <expr> = smartchr#loop(' = ', '=') " =キートグル
""""""""""""""""""""""""""""""
" vim-fugitive オプション

""""""""""""""""""""""""""""""
" deoplete.nvim オプション
" let g:deoplete#enable_at_startup = 1 " 自動有効
""""""""""""""""""""""""""""""
" 各種設定
""""""""""""""""""""""""""""""

" タブ入力とインデント(http://blog.sojiro.me/blog/2014/12/26/tab-and-space-on-vim/)
set expandtab " ソフトタブを有効に
set tabstop=2 " ソフトタブの空白の幅
set softtabstop=2 " 連続した空白に対してタブやバックスペースでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続
set smarttab " 行頭のタブに対してshiftwidthの幅だけ増減
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減
set shiftwidth=2 " オートインデント時の空白の幅
set backspace=indent,eol,start " バックスペースでなんでも消せるように

" 表示設定
set list " 不可視文字の可視化
set listchars=tab:»-,trail:-,eol:↲,nbsp:% " 不可視文字の表示形式
set number " 行番号の表示
set showmatch " 対応する括弧の表示
syntax on " シンタックスハイライトを有効
set cmdheight=2 " コマンドラインに使われる画面上の行数
set ruler " カーソルが何行目の何列目に置かれているかを表示
set title " タイトルバーにファイルのパス情報等を表示
set display=uhex " 印字不可能文字を16進数で表示
set lazyredraw " コマンド実行中は再描画しない

" ステータスライン表示 http://blog.ruedap.com/2011/07/12/vim-statusline-git-branch-name
set statusline=%F " ファイル名表示
set statusline+=%m " 変更チェック表示
set statusline+=%r " 読み込み専用かどうか表示
set statusline+=%h " ヘルプページなら[HELP]と表示
set statusline+=%w " プレビューウインドウなら[Prevew]と表示
set statusline+=%= " これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] " ファイルエンコードを表示
set statusline+=[LOW=%l/%L] " 現在行数と全行数を表示
set laststatus=2 " エディタウィンドウの末尾から2行目にステータスラインを常時表示

  set statusline=%< " 行が長すぎるときに切り詰める位置
  set statusline+=[%n] " バッファ番号
  set statusline+=%m " %m 修正フラグ
  set statusline+=%r " %r 読み込み専用フラグ
  set statusline+=%h " %h ヘルプバッファフラグ
  set statusline+=%w " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'} " fencとffを表示
  set statusline+=%y " バッファ内のファイルのタイプ
  set statusline+=\ " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F " バッファ内のファイルのフルパス
else
  set statusline+=%t " ファイル名のみ
endif
  set statusline+=%= " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()} " Gitのブランチ名を表示
  set statusline+=\ \ " 空白スペース2個
  set statusline+=%1l " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L " バッファ内の総行数
  set statusline+=,
  set statusline+=%c " 何列目にカーソルがあるか
  set statusline+=%V " 画面上の何列目にカーソルがあるか
  set statusline+=\ \ " 空白スペース2個
  set statusline+=%P " ファイル内の何％の位置にあるか

" カーソル設定
set whichwrap=b,s,h,l,<,>,[,] " カーソル移動で行末から次の行頭への移動が可能
set cursorline " カーソルラインをハイライト

" コマンドの補完
set wildmenu " コマンドラインモードで<Tab>キーによるファイル名補完を有効
set showcmd " 入力中のコマンドを表示する
set history=500 " 保存するコマンド履歴の数

" クリップボードからペーストする時だけインデントしない
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

" vimを終了してもUNDO履歴を保存
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" 自動成形関連
set textwidth=0 " 自動折り返しをしない
set formatoptions=lmoq " テキスト整形オプション、マルチバイト系を追加

" Swap, Backupなどを無効化
set nowritebackup
set nobackup
set noswapfile

" 検索設定
set ignorecase " 大文字小文字を無視して検索
set smartcase " 大文字を含む場合、大文字と小文字を区別して検索
set hlsearch " 検索結果をハイライト表示
set noincsearch " インクリメンタルサーチしない
set wrapscan " 検索結果の最後から最初に戻る
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> " ESC2回でハイライト切替

" ファイル関連
set ambiwidth=double " vimに全角を解釈させる
set autoread " 外部エディタの変更を自動反映
set hidden " 変更中でも他のファイルを開く

" その他
set background=dark " 暗い背景色に合わせた配色にする
set visualbell t_vb= " ビープ音を鳴らさない

""""""""""""""""""""""""""""""
" 保存時の自動成型 https://qiita.com/katton/items/bc9720826120f5f61fc1
""""""""""""""""""""""""""""""
function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " 保存時にtabを2スペースに変換する
    %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()
""""""""""""""""""""""""""""""
" 全角スペースの表示 http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
if has("syntax")
  syntax on
  " PODバグ対策
  syn sync fromstart
  function! ActivateInvisibleIndicator()
    " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
  endfunction
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
""""""""""""""""""""""""""""""
" jkで見た目通りの上下（カーソルキーは行番号ごとの上下で変更なし）
""""""""""""""""""""""""""""""
