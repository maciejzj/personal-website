# Simple static blogger

I decided to create this website to share my tech related work.
However I discovered that the mainstream tools for blogging are not so great
if you want to make a very simple and effortless website.
Popular tools often seem to be too convoluted (there are Hugo tutorials on the
youtube that last dozens of minutes) for my use case.
Surely, there are many great tools, but I wanted something barebone simple that
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

1. A POSIX compliant shell and your favourite Markdown renderer (pandoc by
   default) are required.
2. Download `ssb` and place it in your `PATH` or inside your blog directory.
3. Run `ssb -g` to generate html and css templates. Adjust the header and the
   footer to your liking, you can customize the stylesheet, use a css theme,
   or your favourite style for Markdown.
4. Write your `index.md` page and posts in `posts` directory.
5. Run `ssb index.md` to generate `html` files. Ssb will append header, list of
   posts and footer to each file.
6. The timestamps near posts titles are generated from modification dates of
   Markdown files.
   If you wish to change them use the `touch` command.
7. Publish your blog.

## Goals, features and non-features

* Ssb is a single POSIX compliant script that requires only a Markdown renderer
  to create blogs.
* It is not a *real framework*, just a hackable script to automate blogging and
  save your time.
* Useful as is without editing source, easily expandable source if you want.
* No tags, no artifacts, no javascript, no learning, no lengthy setup.
* If you want a simple and effortless blogging engine ssb is perfect for you,
  whether you want something with more features you can hack it, or use
  frameworks like Jekyll or Hugo.
* Customization with direct editing of html header, footer and css stylesheet.

## Help

```
./ssb -h
Usage: ./ssb [-d|-g|-h|-r] [-e HEADER_PATH] [-f FOOTER_PATH] [-m MD_RENDERER]
                           [-o OUTPUT_DIR] [-p POSTS_DIR]
```

## How to get it

If you want to give ssb a try you can get it from the github
[repo](https://github.com/MaciejZj/ssb).

Stylesheets for theming can be found
[here](https://github.com/maciejzj/ssb-themes).
