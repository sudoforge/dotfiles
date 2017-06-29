# bddenhartog/dotfiles

A quick-start collection of my dotfiles. Clone this repository, then follow
the installation instructions below.

## Dependencies

- [`rcm`][gh-thoughtbot-rcm]

## Installation

Installation with `rcup` is fairly straightforward:

```bash
$ git clone https://github.com/bddenhartog/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ rcup -v -x 'README.md'
```

## Subsequent updates

To update from this repository, simply `cd ~/.dotfiles` and execute the
following:

```bash
$ rcdn -x 'rcrc'
$ git pull
$ rcup
```

## License

MIT License

Copyright (c) Benjamin Den Hartog <@bddenhartog>

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

[gh-thoughtbot-rcm]: https://github.com/thoughtbot/rcm "view the thoughtbot/rcm repository"
