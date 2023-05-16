# sudoforge/dotfiles

Dotfiles used to configure my desktop and shell environments. While I try to
ensure that the scripts, configuration files, and other such files of substance
within this repository are well-documented and portable, please note that they
are designed for my own usage on the systems I use.

As such, cloning this repository and using the configuration within it without
modifications is done so at your own risk. I offer no guarantees for the
stability of these configuration files. See the [LICENSE](LICENSE) for more
info.

## Dependencies

- [`stow`][stow]
- And these fonts:
  - [`Intel One Mono`][intel-one-mono]
  - [`Symbols Nerd Font`][symbols-nerd-font]

[stow]: https://www.gnu.org/software/stow/ "GNU Stow"
[intel-one-mono]: https://github.com/intel/intel-one-mono
[symbols-nerd-font]: https://github.com/ryanoasis/nerd-fonts

## Installation

The widely-available `stow` is recommended to use to manage the symlinks for the
files and directories in this repository. Below are instructions for using it to
install both individual packages and all packages.

> **NOTE**
>
> In `stow` terminology, a "package" is simply a directory, not a "package" in
> the sense of the word you may be used to.

The following commands assume that you are in the root directory of this
repository.

```
# To install a single package
$ stow -t "$HOME" <package-name>

# To install all of the packages indiscriminately
$ find * -maxdepth 0 -type d | xargs stow -t "$$HOME"

  # or call the default make target
  $ make

  # to see verbose output...
  $ make debug

```

> You can use whatever symlink farm manager you'd like, however, this project
> was built for compatibility with `stow`.

# Contributing

I welcome any and all improvements to this repository, however, note that as
these are my personal configuration files and this repository is not intended
for mass consumption, I have no intent to add support for software that I do not
use.

# Licensing

Licensed under the Apache 2.0 License. See the full license text
[here](LICENSE).
