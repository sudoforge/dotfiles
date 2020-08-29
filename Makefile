default:
	@/usr/bin/env printf "Installing all packages... "
	@/usr/bin/env \
		find * -maxdepth 0 -type d | xargs stow -t "$$HOME" > /dev/null 2>&1 \
		&& printf "OKAY\n" \
		|| ( printf "FAIL\nTo see error messages, run $`make debug$`.\n\n" && exit 1 )

.PHONY: debug
debug:
	@/usr/bin/env find * -maxdepth 0 -type d | xargs stow -t "$$HOME" --verbose=3

.PHONY: delete
delete:
	@/usr/bin/env find * -maxdepth 0 -type d | xargs stow -D -t "$$HOME" --verbose=1
