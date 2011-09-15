" Vim configuration - Andrew Horsman [basicxman]

" Operating system dependent options
if has("win32") || has("unix")
  source $VIMRUNTIME/mswin.vim
  behave mswin
endif

if has("win32")
  :cd C:\Users\Andrew
  set guifont=Consolas
else
  :cd ~/Dropbox/Development
endif

" autocmd options
if has("autocmd")
  " Automagically reload vimrc after edit.
  autocmd bufwritepost .vimrc source $MYVIMRC 
  autocmd bufwritepost _vimrc source $MYVIMRC " Windows :|

  " Load indent files for language-dependent indenting.
  call pathogen#helptags()
  call pathogen#runtime_append_all_bundles()
  filetype on
  filetype indent on
  filetype plugin on

  " JSON.vim
  au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 
  au! BufRead,BufNewFile *.js   set filetype=javascript syntax=jquery
endif

runtime! macros/matchit.vim

" gvim options
if has("gui_running")
  set guioptions-=T
  set guioptions+=LlRrb " Small hack to remove scrollbars in gvim.
  set guioptions-=LlRrb
endif

if has("gui_macvim")
  let g:CommandTMaxHeight=20

  map <D-e> <Leader>v:ConqueTerm bash<CR>
  map <D-/> <plug>NERDCommenterToggle<CR>
  imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
  map <D-F> :Ack<space>
end

" <injekt> In many terminal emulators the mouse works just fine, thus enable
" it.
if has('mouse')
  set mouse=a
endif

" Regular options
" ---------------
set nocompatible  " Who the hell uses vi?
set title         " Set window title
set number        " Line numbering
set showmatch     " Match opening/closing punctuation together
set nowritebackup " Git is my backup.
set foldenable    " Folding <3 (take that injekt!)
set noswapfile    " wurt.
set ruler         " Cursor position!
set noerrorbells  " Annoying as !@#$
set visualbell    " Flashes screen for 20mS instead of error bell.
set cursorline    " Highlight line of cursor (awesome sauce)
set nowrap        " Also annoying.
set splitbelow    " Splitting buffers goes below instead of above
set showmatch     " Matching brackets/braces etc
set nohlsearch    " Highlighting searches are so annoying.
set incsearch     " Incremental searching.
set noequalalways
set backupdir=~/.vim/backup
set directory=~/.vim/backup

set whichwrap+=<,>,h,l,b,[,] " Backspace and cursor keys wrap back to previous line!
set history=2000             " Command history

set clipboard=unnamed " Share system clipboard.

cmap w!! %!sudo tee < /dev/null %

" Set map leader for misc normal mode commands.
let mapleader = ","

map <Leader><Leader> :ZoomWin<CR>

" Indentation
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" Tab completion
set wildmode=list:longest,list:full

" Themeing
" FYI, Solarized plugin is a massive amount of #winning
syntax enable
if has("gui_running")
  set background=dark
  colorscheme solarized
endif

" Keyboard shortcuts
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <C-b> :tabclose<CR>
imap <C-b> <Esc>:tabclose<CR>
nmap <C-Tab> :tabn<CR>
imap <C-Tab> <Esc>:tabn<CR>
nmap <C-S-Tab> :tabp<CR>
imap <C-S-Tab> <Esc>:tabp<CR>

nmap <C-d> dd
imap <C-d> <Esc>dd

" Retrace movements.
nmap <Leader>f <C-O>
nmap <Leader>r <C-I>

" Last modification
nmap <Leader>l `.

" Move between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

nmap <C-S> :update<CR>
imap <C-S> <Esc>:update<CR>
vmap <C-S> <Esc>:update<CR>

nmap <Leader>co :tabedit ~/.vim/bundle/config.json<CR>
nmap <Leader>vrc :tabedit $MYVIMRC<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>h :split<CR>
nmap <Leader>v :vs<CR>

" Escape alternative
imap <C-space> <Esc>

" Go to end/state of line.
inoremap <S-Right> <Esc>$i
inoremap <S-Left> <Esc>^i

" Sometimes I have a comment on the above line and would instead like to
" append it to the next line.
nmap <Leader>lda ^d$j$a<Space><C-V>

" Sorry, no mercy.
nnoremap <Left> :echoe "Use h!"<CR>
nnoremap <Right> :echoe "Use l!"<CR>
nnoremap <Up> :echoe "Use k!"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
source ~/gist_credentials.vim
