" General {
    set background=dark " assume a dark background
    set number          " enable display of current line in gutter
    set relativenumber  " turn on relative-position line numbers
    set nocompatible

    filetype plugin indent on " automatically detect file types
    syntax on                 " enable syntax highlighting

    " turn omnicomplete on
    set omnifunc=syntaxcomplete#Complete

    " format ft:terraform on save
    let g:terraform_fmt_on_save = 1
" }

" Formatting {
    set autoindent    " indent at the same level as the previous line
    set expandtab     " tabs are spaces, not tabs
    set laststatus=2  " always show statusline
    set nojoinspaces  " don't put spaces after punctuation on a join
    set ruler         " display row, column information in bottom right
    set shiftwidth=2  " use indents of X size
    set softtabstop=2 " backspace can delete indents
    set tabstop=2     " indent every X columns
    set textwidth=80  " break lines at this many characters
    set wrap          " automatically wrap lines

    " splits
    set splitbelow
    set splitright
" }

" Javascript {
    let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" }

" Keymaps {
    " unbind the arrow keys
    nnoremap <Up> <Nop>
    inoremap <Up> <Nop>
    vnoremap <Up> <Nop>
    nnoremap <Down> <Nop>
    inoremap <Down> <Nop>
    vnoremap <Down> <Nop>
    nnoremap <Left> <Nop>
    inoremap <Left> <Nop>
    vnoremap <Left> <Nop>
    nnoremap <Right> <Nop>
    inoremap <Right> <Nop>
    vnoremap <Right> <Nop>

    " bind 'jj' to <esc>
    inoremap jj <esc>
" }
