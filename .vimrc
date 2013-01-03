" ===============================================================
" Filename: $HOME/.vimrc
" Purpose: Setup file for program " Vim "
" Last Update: 2013.01.01
" Author: Yusuke Watanabe < yusuke.w62@gmail.com >
" ===============================================================

" ===============================================================
" Encoding
" ===============================================================
" 文字コードの自動認識
if &encoding !=# 'utf-8'
    set encoding=japan
    set fileencoding=japan
endif

if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " fileencodingsを構築
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
        let &fileencodings = &fileencodings .','. s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings .','. s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings .','. s:enc_euc
        endif
    endif
    " 定数を処分
    unlet s:enc_euc
    unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

" ===============================================================
" System
" ===============================================================
" Viとの互換モード
set nocompatible

" バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

" 自動保存(5min)
set updatetime=300000

" ヒストリー
set history=500

" ===============================================================
" Visual
" ===============================================================
" カーソルラインの強調表示を有効化
set cursorline

" 折りたたみの形式
set foldmethod=marker

" ステータスラインを常に表示
set laststatus=2

" 行番号を表示する
set number

" カーソルの表示
set ruler

" コマンドを画面の最下行に表示する
set showcmd

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" タブバーを表示
set showtabline=2

" ステータスラインの内容
set statusline=[%n]\                                        " バッファ番号
set statusline+=%F\                                         " ファイル名の絶対パス
set statusline+=%m\                                         " バッファ状態[+]
set statusline+=%r                                          " 読み取り専用フラグ
set statusline+=%<%=                                        " 右寄せ
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'}\   " フォーマット＆文字コード
set statusline+=%y\                                         " タイプ
set statusline+=%4l,%2c\                                    " 行、列
set statusline+=%3p%%\                                      " 何％
set laststatus=2

" タイトルを設定
set title

" 画面端で行を折り返して表示する
set wrap

" シンタックスハイライト有効化
"syntax on

" 挿入モードでステータスラインの色変更
" autocmd InsertEnter * highlight StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none

" ノーマルモードでステータスラインの色変更
" autocmd InsertEnter * highlight StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

" ===============================================================
" search
" ===============================================================
" 検索キーワードをハイライト表示
set hlsearch

" 検索時に大文字小文字を無視する
set ignorecase

" インクリメンタルサーチを行なう
set incsearch

" 大文字を混ぜて検索した場合だけ大文字/小文字を区別する
set smartcase

" ===============================================================
" indent
" ===============================================================
" 新しい行のインデントを現在行と同じにする
set autoindent

" バックスペースでインデントや改行を削除する
set backspace=indent,eol,start

" Cプログラムファイルの自動インデントを始める
set cindent

" タブ入力を空白文字に置き換える
set expandtab

" インデント時に使用されるスペースの数
set shiftwidth=4

" 新しい行を作ったときに高度な自動インデントを行なう
set smartindent

" タブ幅を設定する
set tabstop=4

" コマンドライン補完するときに補完候補を表示する
set wildmenu wildmode=list:full

" ===============================================================
" keymap
" ===============================================================
" ノーマルモードのキーマップ(再帰)
" ESCの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" ノーマルモードのキーマップ(非再帰)
" セミコロンをコロンに変換
nnoremap ; :

" ウィンドウ間移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" タブ
nnoremap <Tab>n :<C-u>tabnew<CR>
nnoremap <Tab>c :<C-u>tabclose<CR>
nnoremap <Tab>l gt
nnoremap <Tab>h gT
nnoremap <Tab>0 :<C-u>tabfirst<CR>
nnoremap <Tab>$ :<C-u>tablast<CR>

" 挿入モードのキーマップ(非再帰)
" カーソル移動
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-h> <Backspace>
inoremap <C-d> <Del>

" ===============================================================
" Vundle
" ===============================================================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle the Vim package manager
Bundle 'gmarik/vundle'

" Beautiful dual light/dark, selective contrast, GUI/256/16 colorscheme
Bundle 'altercation/vim-colors-solarized'

" Buffer Explorer / Browser
Bundle 'bufexplorer.zip'

" C/C++ IDE -- Write and run programs. Insert statements, idioms, comments etc.
Bundle 'c.vim'

" Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
Bundle 'DrawIt'

" A Git wrapper so awesome, it should be illegal
Bundle 'fugitive.vim'

" Syntax file for jQuery
Bundle 'jQuery'

" Ultimate auto completion system for Vim
Bundle 'neocomplcache'

" Open URI with your favorite browser from your favorite editor
Bundle 'open-browser.vim'

" Run a command and show its result quickly
Bundle 'quickrun.vim'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
Bundle 'taglist.vim'

" A tree explorer plugin for navigating the filesystem
Bundle 'The-NERD-tree'

" Unite all sources
Bundle 'unite.vim'

" vim plugins for HTML and CSS hi-speed coding
Bundle 'ZenCoding.vim'

filetype plugin indent on

" vim-colors-solarized
syntax enable
" set background=light
set background=dark
colorscheme solarized

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1

" unite.vim
nnoremap <Leader>. :Unite file_mru<CR>
nnoremap <Leader>f :Unite file<CR>
nnoremap <Leader>b :Unite buffer<CR>

" open-browser.vim
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

" The-NERD-tree
autocmd VimEnter * NERDTree ./

" ===============================================================
" Command
" ===============================================================
command! ToUTF8 set fileencoding=utf-8
command! ToEUC set fileencoding=euc-jp
command! ToSJIS set fileencoding=sjis
command! Reload source $HOME/.vimrc

" 保存時に空白を削除
autocmd BufWritePre * :%s/\s\+$//e"
