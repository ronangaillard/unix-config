" Colorizes text
colo moriarty
syntax on

" Diplays line number
set nu

" Autoindent code depending on file extension
filetype indent on

" Replaces tab with spaces (super useful for Python)
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"Auto indent
set ai
"Smart indent
set si
"Wrap lines
set wrap

" Kind of wraps text
"set textwidth=80

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=800

" Set 7 lines to the cursor - when moving vertically using j/k
" So that the cursor moves faster
set so=7

"Always show current position
set ruler

" Highlight search results
set hlsearch

" Turn off backup as most files edited with vim are backed up using git
set nobackup
set nowb
set noswapfile

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\%l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
            return 'PASTE MODE  '
    en
    return ''
endfunction
