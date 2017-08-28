" general options
syntax on
filetype plugin indent on
set background=dark

" indentation
set expandtab
set tabstop=4
set shiftwidth=4
autocmd FileType toml setlocal shiftwidth=2 tabstop=2

" enable current _and_ relative line numbering
set number
set relativenumber

" set the cursor position to the first position for git commit messages
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
