# bddenhartog/dotfiles

A quick-start collection of my dotfiles. Clone this repository, then follow
the installation instructions below.

## Dependencies

- [`rcm`][gh-thoughtbot-rcm]

## Installation

Installation with `rcup` is fairly straightforward:

```bash
$ git clone https://github.com/bddenhartog/dotfiles.git
$ cd dotfiles
$ rcup -v -x '*.md' -x 'Makefile'
```

Alternatively, you can run `make install`, which takes care of excluding
the proper patterns.

## License

Licensed under the MIT License. [View the license](LICENSE.md) and go wild.

[gh-thoughtbot-rcm]: https://github.com/thoughtbot/rcm "view the thoughtbot/rcm repository"
