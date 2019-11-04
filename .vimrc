" LEADER KEY
" Unmap Space key before setting it as Leader key
nnoremap <Space> <Nop>
let mapleader=' '

" Change timeout listening to shortcuts with leader key
set notimeout
set ttimeout
" END LEADER KEY

set clipboard=unnamed

" LINE NUMBER SETUP
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END
" END LINE NUMBER SETUP

" CURSOR
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set mouse=a

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
" END CURSOR

set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required

" PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
" If installed using Homebrew

call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vimux setup
Plugin 'benmills/vimux'
map <Leader>rr :wa<CR> :VimuxRunLastCommand<CR>
map <Leader>rn :wa<CR> :VimuxPromptCommand<CR>
map <Leader>m :wa<CR> :VimuxRunCommand("make")<CR>
map <Leader>b :wa<CR> :VimuxRunCommand("make && make run")<CR>
map <Leader>t :wa<CR> :VimuxRunCommand("make test")<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
let g:VimuxRunnerIndex = 4

Plugin 'vim-scripts/a.vim'

" Git diff in editor
Plugin 'airblade/vim-gitgutter'

Plugin 'christoomey/vim-tmux-navigator'

set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
map <Leader>f :w<CR> :Files<CR> 
map <Leader>q :q<CR>

Plugin 'bluz71/vim-moonfly-statusline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END PLUGINS

" Fix backspace
set nu

" Set bottom line theme
let g:airline_theme='raven'

" Change bottom bar color
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ }
set noshowmode

" Enable highlighting of the current line
set cursorline

set encoding=UTF-8

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1
"
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Use Unix as the standard file type
set ffs=unix,dos,mac
"
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Save on lost focus
:au FocusLost * silent! wa
:set autoindent

" Fluently move btw panes and buffers
inoremap <C-J> <ESC><C-W><C-J>
inoremap <C-K> <ESC><C-W><C-K>
inoremap <C-L> <ESC><C-W><C-L>
inoremap <C-H> <ESC><C-W><C-H>

" Useful for pasting
nnoremap <leader>p :set invpaste<CR>

" Lazy go back to normal mode 
imap jj <Esc>

" Auto close brackets
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Custom line creation
nnoremap o o<Esc>
nnoremap O O<Esc>
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Switch btw c file and header with Leader key
nnoremap <Leader>a :w<CR>:A<CR>

" Unmap shortcuts of a.vim in edit mode
iunmap <Leader>is
iunmap <Leader>ih
iunmap <Leader>ihn
