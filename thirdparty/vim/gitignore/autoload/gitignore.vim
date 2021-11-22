function! gitignore#negate() abort
  silent! substitute/^!// | substitute/^/!/
  silent! call repeat#set(":exec gitignore#negate()\<CR>", -1)
  return ''
endfunction
