" USABILITY
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy search
Plugin 'majutsushi/tagbar' " ctags display
Plugin 'mattn/webapi-vim' " interface to the web
Plugin 'tpope/vim-obsession' " continuously updated session files

" vim-easy-align {
  Plugin 'junegunn/vim-easy-align' " easily align things

  " keymaps
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
" }

" SYNTAX
Plugin 'hashivim/vim-terraform'
Plugin 'jparise/vim-graphql'
Plugin 'ledger/vim-ledger'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'pearofducks/ansible-vim'

" LANGUAGE
Plugin 'fatih/vim-go'

" rust {
  Plugin 'rust-lang/rust.vim'

  " :RustPlay - pipe the URI to the clipboard using this command
  let g:rust_clip_command = 'xclip -selection clipboard'
" }
