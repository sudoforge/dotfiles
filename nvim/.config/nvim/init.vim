""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"
" The options set below are general defaults, and may be overridden for specific
" filetypes. Filetype-specific settings are preferred when
" changing non-global behavior, such as interface options, like `background` or
" `number`.
"
" For that reason, options for a specific filetype, such as indentation, should
" be set in that filetype's ftplugin.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable vi compatiblity mode
set nocompatible

" automatically detect file types
filetype plugin indent on

" enable syntax highlighting
syntax on

" autoformat rust files on save via rust.vim
let g:rustfmt_autosave = 1

" don't require the .jsx extension
" this is used to allow JSX highlighting in .js files
let g:jsx_ext_required = 0

" coc.nvim config
set hidden
let g:coc_global_extensions = ["coc-tsserver", "coc-json", "coc-go", "coc-rust-analyzer"]

" vim-lsc configuration
let g:lsc_auto_map = v:true

" fzf.vim configuration
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-file "~/.ignore"'

" navigate the pop-up menu using tab, shift+tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" accept the pop-up menu selection using Enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" close the pop-up menu when the completion selection is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" disable backup, swap, and undo files
set nobackup
set noswapfile
set noundofile

" automatically save when switching buffers
autocmd BufLeave * silent! wall

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI settings
"
" The settings below affect the interface or user experience. These should be
" considered "global defaults", as some options (e.g. indentation related
" options) maye be overridden for specific filetypes. See ~/.config/
"
" See `:help <option>` for more information.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent      " indent at the same level as the previous line
set background=dark " assume a dark background
set expandtab       " insert spaces when <tab> is pressed
set gdefault        " use the 'g' flag by default with :s/foo/bar/
set ignorecase      " make searching case insensitive
set laststatus=2    " always show the statusline
set nojoinspaces    " don't put spaces after punctuation on a join
set nostartofline   " do not jump to the first character with page commands
set number          " enable display of current line in gutter
set relativenumber  " turn on relative-position line numbers
set ruler           " display row, column information in bottom right
set shiftwidth=2    " use indents of X size
set smartcase       " override `ignorecase` when query contains [A-Z] characters
set softtabstop=2   " backspace can delete indents
set splitbelow      " :split puts the new window below
set splitright      " :vsplit puts the new window to the right
set tabstop=2       " indent every X columns
set textwidth=80    " break lines at this many characters
set wrap            " automatically wrap lines

" set the color scheme to gruvbox dark
autocmd vimenter * colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" session-related options
"
" The following options relate to 'sessions', which are a way to save the active
" state of the editor.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ssop-=options
set ssop-=folds

"===============================================================================
" Key mappings
"===============================================================================

" disable arrow key movement
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

" bind 'jj' to <esc>
inoremap jj <esc>

" disable C-c in visual mode
vnoremap <C-c> <NOP>

" Use C-j to move from visual mode to normal mode, which is especially
" convenient considering that we exit normal mode with 'jj', and even more
" comfortable when the Control key is mapped to something else, e.g. CapsLock.
vnoremap <C-j> <esc>

" disable exit
map <C-z> <nop>

" saner start and end of line keys
nnoremap H ^
nnoremap L $

" select to the end of the line
nmap vL v$

" select to start of line
nmap vH v^

" yank to end of line
nmap yL y$

" yank to start of line
nmap yH y^

" delete to end of line
nmap dL d$

" delete to start of line
nmap dH d^

" go to next buffer
nmap <Tab> :bnext<CR>

" go to previous buffer
nmap <S-Tab> :bprev<CR>

" unbind enter in normal mode
nmap <silent> <CR> <nop>

" prevent deselection after indenting
vnoremap < <gv
vnoremap > >gv

" resize splits
nmap + <C-w>+
nmap - <C-w>-
nmap \| <C-w><
nmap \  <C-w>>

" prevent accidentally deleting a fold
nmap zd <nop>
nmap zE <nop>

" disable man page on current word
nmap <S-k> <nop>

" find and replace instances of the word under the cursor
nmap <S-k> :%s/\<<C-r><C-w>\>/

" coc shortcuts
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-space> <Plug>(coc-references)

" fzf shortcuts
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Rg<space>

" Avoid annoying lack of pane/split navigation in insert mode
inoremap <C-h> <ESC>:TmuxNavigateLeft<CR>
inoremap <C-j> <ESC>:TmuxNavigateDown<CR>
inoremap <C-k> <ESC>:TmuxNavigateUp<CR>
inoremap <C-l> <ESC>:TmuxNavigateRight<CR>

" Terminal-mode key mapping
" <C-\><C-n> exits terminal mode
"===============================================================================

" Make moving around to other splits more natural
tnoremap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

" Make initiating buffer scrolling natural
tnoremap <C-u> <C-\><C-n><C-u>

" Exit terminal mode with C-j
tnoremap <C-j> <C-\><C-n>

hi vertsplit guifg=bg guibg=bg
