colorscheme atom-dark-256
set visualbell t_vb=

if has('gui_macvim')
    set noundofile
    set transparency=10
    set antialias
    set guifont=Monaco:h14
    set columns=120
    set lines=50
    set lines=50
    set textwidth=0
    set nobackup
    highlight Cursor guifg=NONE guibg=Green
    highlight CursorIM guifg=NONE guibg=Purple
    set noimdisableactivate
    set clipboard+=unnamed
endif
