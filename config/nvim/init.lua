-- shine like the star you are
vim.cmd("set nocompatible")
vim.cmd("filetype off")

---------------- Miscellany --------------
-- Don't beep at me
vim.cmd("set visualbell")
vim.cmd("set noerrorbells")
-- Make it look pretty
--vim.cmd("colorscheme desert")
vim.cmd("syntax enable")
vim.cmd("set nu")


-------- Knobs. Also Dials -------
vim.cmd("set ttimeoutlen=0")               -- time waits for no man's editor
vim.cmd("set hidden")                      -- monsters in the dark
vim.cmd("set scrolloff=999")               -- what's the biggest number you can think of?
vim.cmd("set laststatus=2")                -- and never darken my doorstep again
vim.cmd("set nowrap")                      -- stop complaining and get a bigger monitor
vim.cmd("set cursorline")                  -- first among equals
vim.cmd("set showmatch")                   -- where will i % to next?
vim.cmd("set backspace=indent,eol,start")  -- spamming backspace should always do something
vim.cmd("set encoding=utf-8")              -- gaze on with uninterrupted incomprehension
vim.cmd("set history=1000")                -- never forget
vim.cmd("set visualbell")


-------- General Remappings ------
vim.cmd("let mapleader=\",\"")
-- Don't be picky about quitting
vim.cmd("ca Q q")
vim.cmd("ca W w")
vim.cmd("ca X x")
-- FfTt backwards
vim.cmd("noremap \\ ,")
vim.cmd("nnoremap ; :")
-- At what point did someone decide 'the one on the left takes you to the right'.... >_>
vim.cmd("nnoremap $ ^")
vim.cmd("nnoremap ^ $")
-- Ctrl-C your way to victory
vim.cmd("imap <C-c> <Esc>")
-- Y will conform
vim.cmd("nnoremap Y y^")
-- And K will grep
vim.cmd("nnoremap <silent> K :Ggrep <cword><CR>")


-------- Splits -----------------
vim.cmd("set splitbelow")
vim.cmd("set splitright")

vim.cmd("nnoremap <silent> <Leader>+ :exe \"resize \" . (winheight(0) * 3/2)<CR>")
vim.cmd("nnoremap <silent> <Leader>- :exe \"resize \" . (winheight(0) * 2/3)<CR>")

-------- Tabs and Spaces ---------
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set tabstop=4")


-------- Indentation ------------
vim.cmd("set autoindent")
vim.cmd("set cindent")


-------- 100 Char line limit ------
vim.cmd("let &colorcolumn=join(range(100,101),\",\")")
vim.cmd("highlight ColorColumn ctermbg=235 guibg=#402727")

-- …but don't show it on files that don't make sense:
vim.cmd("autocmd Filetype man setlocal colorcolumn&")
vim.cmd("autocmd Filetype netrw setlocal colorcolumn&")
vim.cmd("autocmd Filetype nerdtree setlocal colorcolumn&")
vim.cmd("autocmd Filetype conque_term setlocal colorcolumn&")
vim.cmd("set ruler")


-------- Undo --------------------
vim.cmd("set undofile")
vim.cmd("set undodir=~/.vim/tmp")
vim.cmd("set undolevels=1000")
vim.cmd("set undoreload=10000")


-------- Completions -------------
vim.cmd("set wildignore+=.git,*.o,*.o")
vim.cmd("set wildmode=longest,list,full")
vim.cmd("set completeopt=menuone")


-------- Searching ---------------
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set incsearch")
vim.cmd("set hlsearch")

vim.cmd("nnoremap <Leader>s :nohlsearch<CR>")


-------- File Opening ---------------
vim.cmd("set wildmode=longest,list,full")
vim.cmd("set wildmenu")

-------- Backups -----------------
vim.cmd("set backup")
vim.cmd("set backupdir=~/.vim/tmp")
vim.cmd("set directory=~/.vim/tmp")


--------- Views ------------------
vim.cmd("set viewdir=~/.vim/tmp")
vim.cmd("set viewoptions=cursor")

-- Syntax and Spacing
-- Space makes spaces and tab makes tabs
vim.cmd("nnoremap <Space> :<C-U>exec \"normal i|\".RepeatChar(nr2char(getchar()), v:count1).\"\\e\"<CR>")
vim.cmd("nnoremap <Tab>   :<C-U>exec \"normal a\".RepeatChar(nr2char(getchar()), v:count1).\"\\e\"<CR>")

vim.cmd("autocmd FileType html setlocal shiftwidth=2 tabstop=2")
vim.cmd("autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab")
vim.cmd("autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab")


-- Plugin' Away
require("config.lazy")
