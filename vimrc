"=================================
" Neobundle Settings
"=================================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Basic
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
" Editor Config
NeoBundle 'editorconfig/editorconfig-vim'
" HTML
NeoBundle 'othree/html5.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'mattn/emmet-vim'
" CSS
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'gorodinskiy/vim-coloresque'
" JavaScript
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/yajs.vim'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mxw/vim-jsx'
" Golang
NeoBundle 'fatih/vim-go'
" Plugins
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kannokanno/previm'
NeoBundle 'cocopon/svss.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-notes'
" Git
" NeoBundle 'airblade/vim-gitgutter'
" Colors
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'gosukiwi/vim-atom-dark'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"=================================
" NeoComplete sSettings
"=================================

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

"=================================
" Vim Indent Guides Settings
"=================================

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg = 236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg = 238
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"=================================
" ESLint Settings
"=================================

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

"=================================
" jsx Settings
"=================================

let g:jsx_ext_required = 0

"=================================
" JsDoc Settings
"=================================

nnoremap <silent><C-l> :JsDoc<CR>

"=================================
" PreVim Settings
"=================================

let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"=================================
" Go Settings
"=================================

autocmd Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4

"=================================
" QuickRun Settings
"=================================

nnoremap <silent><C-r><C-n> :QuickRun<CR>

"=================================
" Vim-Note Settings
"=================================
"
:let g:notes_directories = ['~/Dropbox/notes']

"=================================
" Vim Settings
"=================================

syntax on
set t_Co=256
set display=lastline
colorscheme atom-dark-256
set autoindent
set autoread
set cursorline
set expandtab
set history=10000
set hlsearch
set ignorecase
set list
set listchars=tab:>-,trail:-
set matchtime=1
set nobackup
set nonu
set noswapfile
set nowrapscan
set nowritebackup
set ruler
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set softtabstop=0
set tabstop=2
set tw=0
set wrap

nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 現在日時を入力
nmap <C-t><C-t> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
nmap <C-t><C-j> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S (%a)")<CR>
