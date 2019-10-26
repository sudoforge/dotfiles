set nocompatible

filetype plugin indent on " automatically detect file types
syntax on                 " enable syntax highlighting


" turn omnicomplete on
set omnifunc=syntaxcomplete#Complete


" autoformatting
let g:rustfmt_autosave = 1
let g:terraform_fmt_on_save = 1


" Javascript
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


set background=dark " assume a dark background
set number          " enable display of current line in gutter
set relativenumber  " turn on relative-position line numbers
set autoindent    " indent at the same level as the previous line
set expandtab     " insert spaces when <tab> is pressed
set laststatus=2  " always show the statusline
set nojoinspaces  " don't put spaces after punctuation on a join
set ruler         " display row, column information in bottom right
set shiftwidth=2  " use indents of X size
set softtabstop=2 " backspace can delete indents
set tabstop=2     " indent every X columns
set textwidth=80  " break lines at this many characters
set wrap          " automatically wrap lines
set nostartofline " do not jump to the first character with page commands


" splits
set splitbelow
set splitright


" searches
set ignorecase " make searching case insensitive
set smartcase  " ... unless the query has capital letters
set gdefault   " use the 'g' flag by default with :s/foo/bar/


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


" bind 'jj' to <esc>
inoremap jj <esc>
