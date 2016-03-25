"=================================
" Neobundle Settings
"=================================

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ThomasAdam/tmux'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'gosukiwi/vim-atom-dark'
NeoBundle 'othree/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'kannokanno/previm'
NeoBundle 'fatih/vim-go'
NeoBundle 'thinca/vim-quickrun'

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
" NERDTree Settings
"=================================

let NERDTreeShowHidden = 1
" nnoremap <silent><C-l> :NERDTreeToggle<CR>

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
" QuickRun Settings
"=================================

nnoremap <silent><C-r><C-n> :QuickRun<CR>

"=================================
" Vim Settings
"=================================

syntax on
set t_Co=256
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
nmap <C-o><C-o> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR>
nmap <C-o><C-j> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S (%a)")<CR>

autocmd Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4
