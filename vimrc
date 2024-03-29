" shine like the star you are
set nocompatible
filetype off

" ------------------------------------
"  -------- VUNDLE SETUP  ---------
" ------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Go on, tell me that vim isn't an IDE. I dare ya. I triple dog dare ya!
" Configs exist in this file for ctrl-p
Plugin 'Konfekt/FastFold'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'hashivim/vim-terraform'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'pedrohdz/vim-yaml-folds'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'wfxr/forgit'
Plugin 'ycm-core/YouCompleteMe'


call vundle#end()            " required
filetype plugin indent on    " required
" -------- Vundle Setup End --------


" ------------------------------------
"  -------- VIM Config  ---------
" ------------------------------------

"-------------- Miscellany --------------
" Don't beep at me
set visualbell
set noerrorbells
" Make it look pretty
colorscheme desert
syntax enable
set nu


"------ Knobs. Also Dials -------
set ttimeoutlen=0               " time waits for no man's editor
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
" Don't be picky about quitting
ca Q q
ca W w
ca X x
" FfTt backwards
noremap \ ,
nnoremap ; :
" At what point did someone decide 'the one on the left takes you to the right'.... >_>
nnoremap $ ^
nnoremap ^ $
" Ctrl-C your way to victory
imap <C-c> <Esc>
" Y will conform
nnoremap Y y^
" And K will grep
nnoremap <silent> K :Ggrep <cword><CR>


"------ Splits -----------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"------ Tabs and Spaces ---------
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


"------ Indentation ------------
set autoindent
set cindent


"------ 100 Char line limit ------
let &colorcolumn=join(range(100,101),",")
highlight ColorColumn ctermbg=235 guibg=#402727

" …but don't show it on files that don't make sense:
autocmd Filetype man setlocal colorcolumn&
autocmd Filetype netrw setlocal colorcolumn&
autocmd Filetype nerdtree setlocal colorcolumn&
autocmd Filetype conque_term setlocal colorcolumn&
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

" What do these do??
"autocmd BufWinLeave * if expand("%") != "" | mkview   | endif
"autocmd BufWinEnter * if expand("%") != "" | loadview | endif

"------ Single Character Insert -
function! RepeatChar(char, count)
    return repeat(a:char, a:count)
endfunction

"------ Syntax and Spacing
" Space makes spaces and tab makes tabs
nnoremap <Space> :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)."\e"<CR>
nnoremap <Tab>   :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)."\e"<CR>

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab

"------ Folding ------
let g:fastfold_minlines = 0

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

" ------------------------------------
"  -------- LANGUEAGE SPECIFIC  ---------
" ------------------------------------

"------ Go-ing Places -----------------
let g:go_highlight_diagnostic_errors=0
let g:go_highlight_diagnostic_warnings=0


"------ Terraform Syntax and Spacing
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1


" ------------------------------------
"  -------- PLUGIN CONFIGS ---------
" ------------------------------------

"------- Ctrl-p ------------------
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_case_sensitive = 0
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
 " Use Ag over Grep
 set grepprg=ag\ --nogroup\ --nocolor

 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 let g:ctrlp_user_command = 'ag %s -l -U --nocolor -g ""'
 " Don't cache since ag is fast enough
 let g:ctrlp_use_caching = 0
endif


"------- Easymotion --------------
let g:EasyMotion_leader_key = 'z'


"------- Fuzzy Wuzzy was a Finder ----
set rtp+=/usr/local/opt/fzf
map <C-f> :FZF --height 40<CR>


"------- gitgutter go fast ------
set updatetime=250


"------- NerdTree ------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Start NerdTree when vim starts
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Ignore build dirs
let NERDTreeIgnore = [ '^build$[[dir]]', '^\.pytest_cache$[[dir]]', '^dist$[[dir]]', '.*egg-info$[[dir]]', '^\.git$[[dir]]']



"-------- Syntastic -------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 3
 let g:syntastic_python_python_exec = 'python3'
 let g:syntastic_python_checkers = ['python']


"-------- Tagbar  -------
nmap <C-m> :TagbarToggle<CR>


"------- Undotree ----------------
nnoremap <Leaders>u :UndotreeToggle<CR>


"------ Vim-Go -------
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }


" -------- YouCompleteMe -------
"  Needs a .ycm_custom_conf.py file in the root of a project to pick up
"  docs and completions from source and imported packages
let g:ycm_confirm_extra_conf = 0
map <C-d> :YcmCompleter  GoToDeclaration<CR>
