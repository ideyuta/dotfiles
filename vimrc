if !has('nvim')
  " neovimはデフォルトでutf-8になる
  set encoding=utf-8
endif
scriptencoding utf8

" dein.vim {{{
if &compatible
  set nocompatible
endif

" 以下の設定はコピペ
" see: http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542

" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgit cloneする
if &runtimepath != '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vimの設定を開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリスト
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}


"---------------------------
" 基本設定
"--------------------------

" 検索に関する設定 "{{{
" 検索時に大文字小文字を無視する
set ignorecase
" 特殊な検索ロジックの設定
" @see http://vimwiki.net/?'smartcase'
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻って再び検索する
set wrapscan
" 検索文字列をハイライトする(omited:"hls")
set hlsearch
"}}}

" 編集に関する設定"{{{
" タブの画面上での幅
set tabstop=4
" cindentやautoindent時に挿入されるタブの幅
set shiftwidth=4
" Tabキー使用時にTabでは無くホワイトスペースを入れたい時に使用する
" この値が0以外の時はtabstopの設定が無効になる
set softtabstop=0
" タブをスペースに展開する
set expandtab
" 自動的にインデントする
set autoindent
" バックスペースでインデントや改行を削除できるようにする
" @see http://vimwiki.net/?'backspace'
set backspace=indent,eol,start
" paste/nopasteをtoggleするキーマップ
set pastetoggle=;p
" 補完候補表示、候補1つでも表示、候補文字列の最長の共通部分だけを挿入
set completeopt=menu,menuone
" クリップボードを使う
set clipboard=unnamed
" スペルチェックで日本語を除外する
set spelllang=en,cjk
"}}}

" 画面表示の設定"{{{
" シンタックスハイライトを有効にする
syntax on
" 256色対応
if !has('nvim')
  set t_Co=256
endif
" True color対応
" if has('patch-7.4.1778')
"   set guicolors
" endif
" nvim >= 0.1.5
if has('termguicolors')
  set termguicolors
endif
" nvim < 0.1.5
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set background=dark
" colorscheme
colorscheme atom-dark-256
" 行番号を表示
set number
" ルーラーを表示
set ruler
" タブや改行を表示する
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-
" 長い行を折り返して表示する
set wrap
" 常にステータスラインを表示
set laststatus=2
" コマンドモード入力部分の縦幅
set cmdheight=1
" コマンドをステータス行に表示する
set showcmd
" タイトルバーに情報を表示する
set title
" 縦にラインを引く
set colorcolumn=80
hi ColorColumn guibg=#999999
"" 対応する括弧を強調表示する
set showmatch
"" 対応する括弧の強調表示時間を設定する
set matchtime=2
" 記号を ASCII 文字の2倍の幅にする
set ambiwidth=double
" 必ずカーソルの前後に指定の行数表示してくれるようにする
set scrolloff=5
" エラービープ音の全停止
set visualbell t_vb=
set noerrorbells
" カーソル行のハイライト
" set cursorline
"}}}

" バックアップ・スワップ・履歴に関する設定"{{{
" バックアップファイルを作成しない
set nobackup
" スワップファイルを作成する
set swapfile
" スワップファイルの保存先
set directory=~/.tmp,~/tmp,/var/tmp,/tmp
" 一時的なバックアップファイルを作成する
" ファイルの上書きの前にバックアップを作成
set writebackup
" backup時にコピーしてから元に戻す
set backupcopy=yes
" コマンド履歴の保存数
set history=500
"}}}

" 文字コード/改行コード "{{{
" vim-refのwindowsでの文字化け対策
" http://www.karakaram.com/20120726-vim-ref
if has("win32")
  " set encoding より上に書くこと
  let &termencoding = &encoding
endif
set fileencodings=ucs_bom,utf-8,ucs-2le,ucs-2,cp932
set fileformats=unix,dos,mac
" }}}

" キーマッピング "{{{
" 一つ前のバッファに戻る
nnoremap <C-b> :bp<CR>
" スペルチェック機能 ON / OFF をトグルする
nnoremap <silent><Space>s :<C-u>setl spell! spell?<CR>
" vimrc を再読み込み
nnoremap <Space>rv :<C-u>source ~/.vimrc<CR>
" vimrc を編集
nnoremap <silent><Space>ev :<C-u>edit ~/.vimrc<CR>
" jjでesc
inoremap <silent> jj <ESC>
" mmでカレントディレクトリ移動
nnoremap <silent> mm :lcd %:h<CR>
" searchを閉じる
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" }}}

" indent_guides "{{{
" @see: http://qiita.com/items/fb442cfa78f91634cfaa
" インデントの深さに色を付ける
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=20
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=1

" hi IndentGuidesOdd  ctermbg=235
" hi IndentGuidesEven ctermbg=237
" au FileType coffee,ruby,javascript,python IndentGuidesEnable
" nmap <silent><Leader>ig <Plug>IndentGuidesToggle
" }}}

" jsdoc-vim "{{{
let g:jsdoc_allow_input_prompt = 1
" paramとdescriptionのセパレータ文字列
let g:jsdoc_param_description_separator = '-'
" ES6用の省略記法を許可
let g:jsdoc_enable_es6 = 1
nmap <silent> <C-l> <Plug>(jsdoc)
" }}}"

" previm
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
" }}}"

" vim-jsx {{{
" .jsx拡張子以外のファイルでも有効にする
let g:jsx_ext_required = 0
" }}}

" neocomplete.vim "{{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" flow {{{
" let g:flow#autoclose = 1
" let g:javascript_plugin_flow = 1
" }}}

" eslint {{{
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
" }}}

" typescript {{{
let g:typescript_indent_disable = 1
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
" }}}

" go {{{
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
au FileType go setlocal sw=4 ts=4 sts=4 noet
au FileType go setlocal makeprg=go\ build\ ./... errorformat=%f:%l:\ %m
au BufWritePre *.go Fmt
filetype plugin indent on
syntax on
" }}}
