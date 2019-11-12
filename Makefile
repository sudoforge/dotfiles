MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))


define vimplugin
	git subtree $(1) \
		--prefix "vim/pack/default/start/$(shell basename $(2))" \
		--squash \
		$(2) \
		master
endef


.PHONY: default
default: vim/update


.PHONY: vim/install
vim/install/%:
	$(call vimplugin,add,https://github.com/$(subst vim/install/,,$@))
	@echo "	\$$(call vimplugin,pull,https://github.com/$(subst vim/install/,,$@))" >> $(MAKEPATH)
	@git add $(MAKEPATH)
	@git commit --amend --no-edit


.PHONY: vim/update
vim/update:
	$(call vimplugin,pull,https://github.com/sheerun/vim-polyglot)
	$(call vimplugin,pull,https://github.com/christoomey/vim-tmux-navigator)
	$(call vimplugin,pull,https://github.com/rust-lang/rust.vim)
	$(call vimplugin,pull,https://github.com/ctrlpvim/ctrlp.vim)
	$(call vimplugin,pull,https://github.com/fatih/vim-go)
	$(call vimplugin,pull,https://github.com/godoctor/godoctor.vim)
	$(call vimplugin,pull,https://github.com/jparise/vim-graphql)
	$(call vimplugin,pull,https://github.com/neoclide/coc.nvim)
