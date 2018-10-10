# sudoforge/dotfiles

A quick-start collection of my dotfiles. Clone this repository, then follow
the installation instructions below.

## Dependencies

- [`rcm`][thoughtbot-rcm]
- A C preprocessor, to enable Xresources `#include` statements, such as:
    - [`gcc`][gcc]

[gcc]: https://www.archlinux.org/packages/core/x86_64/gcc/ "Arch Linux package: gcc"
[thoughtbot-rcm]: https://github.com/thoughtbot/rcm "thoughtbot/rcm"

### Optional dependencies

- [`git-crypt`][git-crypt]
- [`git-lfs`][git-lfs]
- [`zsh-autosuggestions`][zsh-autosuggestions]

[git-crypt]: https://github.com/agwa/git-crypt "AGWA/git-crypt"
[git-lfs]: https://github.com/git-lfs/git-lfs "git-lfs/git-lfs"
[zsh-autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions "zsh-users/zsh-autosuggestions"

## Installation (first run only)

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

## Updating 

To update from this repository, execute one of the following:

```bash
# Assuming you have not diverged from origin/master and
# have a clean working tree, 'rcdn' will automatically
# run git-pull after removing the symlinks.
$ rcdn
$ rcup -v <path>

# If you have diverged, you should manually update.
$ cd <path>
$ rcdn -d $(pwd)
$ git pull
$ rcup -v -d $(pwd)
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

