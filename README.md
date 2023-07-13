# Personal website

My personal static website. Hosted with GitHub Pages.

## Building

The standalone markdown pages are placed inside the `pages` directory, blog
posts (to be appended to the blog list) are stored inside the `posts` directory.
Generated html files are placed in the `docs` directory (this is required by
GitHub Pages).

### Prerequisites

The website is generated with [ssb](https://github.com/maciejzj/ssb). Homebrew
distribution is available via: `brew install maciejzj/ssb/ssb`.

### Compile into static html files

Run `make`.
