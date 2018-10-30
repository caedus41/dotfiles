set nocompatible                " shine like the star you are
filetype off


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Go on, tell me that vim isn't an IDE. I dare ya. I triple dog dare ya!
" Configs exist in this file for ctrl-p and vim-multiple-cursors
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'


call vundle#end()            " required
filetype plugin indent on    " required

"Miscellany --------------
syntax enable
set nu "the only thing that really matters here, let's be honest
colorscheme desert
filetype plugin on
set visualbell
set noerrorbells


"------ Knobs. Also Dials -------
set ttimeoutlen=0               " time waits for no man's editor
" set clipboard=unnamedplus       " + +
set hidden                      " monsters in the dark
set scrolloff=999               " what's the biggest number you can think of?
set laststatus=2                " and never darken my doorstep again
set nowrap                      " stop complaining and get a bigger monitor
set cursorline                  " first among equals
set showmatch                   " where will i % to next?
set backspace=indent,eol,start  " spamming backspace should always do something
set encoding=utf-8              " gaze on with uninterrupted incomprehension
set history=1000                " never forget
set visualbell


"------ General Remappings ------
let mapleader=","
ca Q q
ca W w
ca X x
noremap \ ,
nnoremap ; :
" At what point did someone decide 'the one on the left takes you to the
" right'.... >_>
nnoremap $ ^
nnoremap ^ $
imap <C-c> <Esc>
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
" nnoremap Y y^

"------ Splits -----------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


"------ Tabs and Spaces ---------
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


"------ Indentation ------------
set autoindent
set cindent

"------ 80 Char line limit ------
"let &colorcolumn=join(range(81,999),",")
"highlight ColorColumn ctermbg=235 guibg=#402727

" …but don't show it on files that don't make sense:
"autocmd Filetype man setlocal colorcolumn&
"autocmd Filetype netrw setlocal colorcolumn&
"autocmd Filetype nerdtree setlocal colorcolumn&
"autocmd Filetype conque_term setlocal colorcolumn&
set ruler


"------ Undo --------------------
set undofile
set undodir=~/.vim/tmp
set undolevels=1000
set undoreload=10000


"------ Completions -------------
set wildignore+=.git,*.o,*.o
set wildmode=longest,list,full
set completeopt=menuone


"------ Searching ---------------
set ignorecase
set smartcase
set incsearch
set hlsearch

nnoremap <Leader>s :nohlsearch<CR>


"------ File Opening ---------------
set wildmode=longest,list,full
set wildmenu

"------ Backups -----------------
set backup
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp


"------- Views ------------------
set viewdir=~/.vim/tmp
set viewoptions=cursor

autocmd BufWinLeave * if expand("%") != "" | mkview   | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif

"------ Single Character Insert -
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction

"------ Syntax and Spacing
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType tf setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

nnoremap <Space> :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)."\e"<CR>
nnoremap <Tab>   :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)."\e"<CR>


"------ Trailing Whitespace -----
function! TrimWhitespace()
    if exists('b:noStripWhitespace')
        return
    endif
    let last_search=@/
    %s/\s\+$//e
    let @/=last_search
endfunction

autocmd BufWritePre * call TrimWhitespace()
autocmd FileType cpp let b:noStripWhitespace=1 " this one's for the Prout :(


"------- Undotree ----------------
nnoremap <Leaders>u :UndotreeToggle<CR>

"------- Fuzzy Wuzzy was a Finder ----
set rtp+=/usr/local/opt/fzf
map <C-f> :FZF --height 40<CR>

"------- gitgutter go fast ------
set updatetime=250

"------- Ctrl-p ------------------
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_case_sensitive = 0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
 "" Use Ag over Grep
 "set grepprg=ag\ --nogroup\ --nocolor

 "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 "let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
 "" Don't cache since ag is fast enough
 "let g:ctrlp_use_caching = 0
endif

"------ Anything sublime can do, vim can do better (with help) ----
"------ Multicursor, don't b0rk my bindings pls ------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-b>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"------- Easymotion --------------
let g:EasyMotion_leader_key = 'z'


"------- Multiple-Cursors --------
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

"------- NERDTREE THINGIES ------
let NERDTreeShowHidden=1

noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
