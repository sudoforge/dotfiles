# sudoforge/dotfiles

A quick-start collection of my dotfiles. Clone this repository, then follow
the installation instructions below.

## Dependencies

- [`rcm`][gh-thoughtbot-rcm]
- [`git-lfs`][gh-git-lfs]
- A C preprocessor, to enable Xresources `#include` statements, such as:
    - [`gcc`][apkg-gcc]

### Optional dependencies

- [`zsh-autosuggestions`][zsh-autosuggestions]

## Installation

Installation with `rcup` is fairly straightforward:

```bash
# Clone the repository to a path on your system
# By default, RCM looks at ~/.dotfiles
$ git clone https://github.com/sudoforge/dotfiles.git <path>

# If <path> is ~/.dotfiles
$ rcup -v

# If <path> is NOT ~/.dotfiles
$ rcup -v -d <path>
```

> **Pro tip**: `~/.rcrc.dirs` is sourced as a shell script, and can contain any
> pre-reading actions you want, such as decrypting an encrypted file in the
> private repository, or extending the various configuration vars like
> `EXCLUDES` or `COPY_ALWAYS`.

## `~/.rcrc.dirs`

This project's `rcrc` file, which is used to configure `rcm`, sources a file
named `~/.rcrc.dirs`. If this file doesn't exist, the `rcm` commands will fail.
This behavior is intended, and is used to enable the user to define multiple
dotfiles directories for `rcm` to manage. This can be useful if, for example,
the user wished to include a separate repository that contains private
configuration files.

To accomplish this, simply edit the contents of `~/.rcrc.dirs` edit the value
of `DOTFILES_DIRS` to your liking. For example:

```
$ tree ~/.dotfiles
/home/<user>/.dotfiles
└── gitconfig # includes ~/.gitconfig.local if it exists

$ tree ~/.dotfiles.secret
└── gitconfig.local # has some secret data

$ cat ~/.rcrc.dirs
DOTFILES_DIRS="$HOME/.dotfiles $HOME/.dotfiles.secret"

$ rcup -v -d /path/to/dotfiles -d /path/to/dotfiles.secret
'/path/to/dotfiles/gitconfig' -> '/home/user/.gitconfig'
'/path/to/dotfiles.private/gitconfig.local' -> '/home/user/.gitconfig.local'
```

## Updating 

To update from this repository, simply `cd ~/.dotfiles` and execute the
following:

```bash
$ rcdn
$ git pull
$ rcup -v
```

## License

MIT License

Copyright (c) Benjamin Den Hartog <@sudoforge>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[gh-thoughtbot-rcm]: https://github.com/thoughtbot/rcm "thoughtbot/rcm"
[gh-git-lfs]: https://github.com/git-lfs/git-lfs "git-lfs/git-lfs"
[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions "zsh-users/zsh-autosuggestions"
[apkg-gcc]: https://www.archlinux.org/packages/core/x86_64/gcc/ "Arch Linux package: gcc"
