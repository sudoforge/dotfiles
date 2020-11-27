" allow for longer lines
set textwidth=120
let g:ledger_maxwidth = 120

" use the main.ledger file for generating reports instead of the current buffer.
"
" i organize my ledger files like so:
"
" ```
" .
" ├── 2020
" │   ├── 01.ledger
" │   ├── 02.ledger
" │   ├── 03.ledger
" │   └── ...
" └── main.ledger
" ```
"
" where `main.ledger` contains the opening balances and then uses `!include` to
" include the files in subsequent directories. this keeps things nice and tidy,
" however, when editing a month-specific file, `vim-ledger` can't see any of the
" other transactions. setting this option to `main.ledger` solves this problem.
let g:ledger_main = '~/code/github.com/sudoforge/hydra/books/main.ledger'

" use { and } to navigate valid ledger blocks instead of paragraphs
noremap { ?^\(\w\\|\d\\|\~\\|!\)<CR>:noh<CR>
noremap } /^\(\w\\|\d\\|\~\\|!\)<CR>:noh<CR>

" on buffer write, align all lines
au BufWrite *.ledger :LedgerAlignBuffer

" on buffer write, lint the ledger file
" au BufWrite *.ledger :silent make | redraw! | cwindow
let g:ledger_extra_options = '--pedantic --explicit --check-payees'
