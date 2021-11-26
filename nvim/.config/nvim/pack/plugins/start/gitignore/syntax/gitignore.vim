if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syntax match gitignoreComment "\v#.*$" contains=@Spell
hi! def link gitignoreComment Comment

syntax match negatePattern "\v!.*$"
hi! def link negatePattern Statement

let b:current_syntax='gitignore'

let &cpo = s:cpo_save
unlet s:cpo_save
