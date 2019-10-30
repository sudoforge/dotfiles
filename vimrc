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

" turn omnicomplete on
set omnifunc=syntaxcomplete#Complete

" autoformat rust files on save via rust.vim
let g:rustfmt_autosave = 1

" autoformat HCL files on save via terraform.vim
let g:terraform_fmt_on_save = 1

" don't require the .jsx extension
" this is used to allow JSX highlighting in .js files
let g:jsx_ext_required = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI settings
"
" The settings below affect the interface or user experience. These should be
" considered "global defaults", as some options (e.g. indentation related
" options) maye be overridden for specific filetypes.
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
set nobackup        " don't create a backup before overwriting files


"===============================================================================
" Key mappings
"===============================================================================

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" bind 'jj' to <esc>
inoremap jj <esc>
