" General {
    set background=dark         " assume a dark background
    set number                  " enable display of current line in gutter
    set relativenumber          " turn on relative-position line numbers

    filetype plugin indent on   " automatically detect file types
    syntax on                   " enable syntax highlighting

    " set the cursor position to the first position for git commit messages
    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
" }

" Formatting {
    set nowrap              " do not wrap long lines
    set autoindent          " indent at the same level as the previous line
    set shiftwidth=4        " use indents of X size
    set expandtab           " tabs are spaces, not tabs
    set tabstop=4           " indent every X columns
    set softtabstop=4       " backspace can delete indents
    set nojoinspaces        " don't put spaces after punctuation on a join 

    " change indentation size for specific files
    autocmd FileType json,tf,toml,yml setlocal expandtab shiftwidth=2 softtabstop=2
" }
