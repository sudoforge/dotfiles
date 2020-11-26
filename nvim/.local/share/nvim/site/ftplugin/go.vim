let g:go_template_file = "/home/sudoforge/.config/nvim/templates.d/go/base.go"
let g:go_template_test_file = "/home/sudoforge/.config/nvim/templates.d/go/test.go"
let g:go_fmt_command = "goimports"

let b:go_fmt_options = {
  \ 'goimports': '-local hydra/',
\ }
