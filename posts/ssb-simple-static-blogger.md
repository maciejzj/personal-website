# Simple static blogger

I decided to create this website to share my tech related work.
However I discovered that the mainstream tools for blogging are not so great
if you want to make a very simple and effortless website.
Popular tools often seem to be too convoluted (there are Hugo tutorials on the
Youtube that last dozens of minutes) for my use case.
Surely, there are many great tools, but I wanted something bare-bones simple that
would require no learning and have as few dependencies as possible.
After a few minutes of research I decided to write my own blog framework in form
of a shell script (there are some bash static site generators
but I decided to make something even simpler and make my own thing for fun).

This was my motivation for creating a simple static blogger - anti-framework
for generating static sites and blogs that tries to follow suckless philosophy
of creating software.

Ssb is heavily inspired and based on
[this](https://benedicthenshaw.com/static_site.html)
post.

## Generated site structure

```
+------------------------------+
| Header and navbar            |
+------------------------------+
|                              |
|                              |
| Body written in Markdown     |
|                              |
|                              |
+------------------------------+
|                              |
| List of posts                |
|                              |
+------------------------------+
| Footer                       |
+------------------------------+
```

## Jump start

Ssb can be installed via homebrew with `homebrew install maciejzj/ssb/ssb` or
just by grabbing the source code distribution and placing it in PATH
(preferably using `install(1)`).

1. Run `ssb -g` to generate html and css templates. Adjust the header and
   the footer to your liking, you can customize the stylesheet, use a css theme,
   or your favourite style for Markdown.
2. Write your `index.md` page and some Markdown posts in `posts` directory.
3. Run `ssb index.md` to generate `html` files. Ssb will append the header, the
   list of posts and the footer to each file.
4. The timestamps near posts titles are generated from modification dates of
   Markdown files. If you wish to change them use the `touch` command (.e.g.
   `touch -t YYMMDDhhmm`).
5. Publish your blog.

It is the most convenient to use `make` for creating sites with ssb. You can
start by adjusting this started makefile:

```makefile
markdown_pages := index.md

posts_dir := posts
output_dir := docs

markdown_posts := $(wildcard $(posts_dir)/*.md)

# Main markdown pages
generated_files := $(foreach page,$(markdown_pages),$(patsubst %.md,$(output_dir)/%.html,$(page)))
# Append posts pages
generated_files += $(foreach post,$(markdown_posts),$(patsubst $(posts_dir)/%.md,$(output_dir)/%.html,$(post)))

.DEFAULT: compile

compile: $(generated_files)

$(generated_files): $(markdown_pages) $(markdown_posts)
	ssb -p $(posts_dir) -o $(output_dir) $(markdown_pages)

.PHONY: clean

clean:
	rm -f $(generated_files)
```

## Goals, features and non-features

* Ssb is a single POSIX compliant script that requires only a Markdown renderer
  to create blogs.
* It is not a *real framework*, just a hackable script to automate blogging and
  save your time.
* Useful as is without editing source, easily expandable source if you want.
* No tags, no artifacts, no Javascript, no learning, no lengthy setup.
* If you want a simple and effortless blogging engine ssb is perfect for you,
  whether you want something with more features you can hack it, or use
  frameworks like Jekyll or Hugo.
* Customization with direct editing of html header, footer and css stylesheet.

## Help

```
ssb -h
ssb - simple static blogger.

Translates input markdown files to html pages. Attaches html header and
footer to each output. Files from the posts directory are appended to a
blog list at the end of each html.

Usage: ssb [-d|-g|-h|-r] [-e HEADER_PATH] [-f FOOTER_PATH][-m MD_RENDERER]
                         [-o OUTPUT_DIR] [-p POSTS_DIR] <MARKDOWN_FILES ...>

Positional arguments:
  MARKDOWN_FILES - Paths to arbitrary number of markdown files that will be
  translated into html files but not appended to the posts list (but will still
  display it at the bottom). It is intended to pass index.md here.

Options:
  -d Don't attach posts list to each html file.
  -g Generate html templates for header, footer and stylesheet.
  -h Show this help message.
  -r Recurse the posts directory.
  -v Be verbose (print each command being executed).

  -e HEADER_PATH Path to a header html file (header.html by default).
  -f FOOTER_PATH Path to a footer html file (footer.html by default).
  -m MD_RENDERER Markdown renderer command name. Must be able to read
     markdown form stdin and output html to stdout (pandoc by default).
  -o OUTPUT_DIR Output directory for html files (. by default).
  -p POSTS_DIR Path to a directory with markdown posts (posts by default).

Usage tips:

The timestamps near posts titles are generated from modification dates of
Markdown files.

If you wish to change them use the touch command (touch -t YYMMDDhhmm).

Credentials: https://github.com/maciejzj/ssb
```

## How to get it and other tips

If you want to give ssb a try you can get it from the GitHub
[repo](https://github.com/MaciejZj/ssb).

Stylesheets for theming can be found
[here](https://github.com/maciejzj/ssb-themes).
