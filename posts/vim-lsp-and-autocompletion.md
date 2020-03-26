# Vim LSP and autocompletion

When trying to ditch any IDE in favour of using Vim you may feel in lack of
language aware autocompletion and other tools for interacting with your code.
This is where Vim plugins come into play.
Thanks to LSP (*Language Sever Protocol*) you can get not only autocompletion,
but also hover information, code navigation and refactoring tools in Vim.

However making such features work in Vim can be not so trivial, as it requires
some work and there are many competing solutions to this, which may be
terribly confusing.

I'll give you my recipe for making Vim feature reach editor and some explanation
of how the setup works.
Also I'll show some alternatives and provide rationale for choosing LSP over
them.

![Four examples of Vim LSP features with Python and C++](https://github.com/maciejzj/website/blob/master/media/vim-lsp-and-autocompletion-overview.png?raw=true)

## Tldr; if you just want IDE like autocompletion

The explanation of the setup and overview of different methods of getting
autocompletion is quite lengthy so if you want to get LSP working quickly
just follow steps in this paragraph.

1. Make sure you have a plugin manager for Vim. If you don't have one
   [Vim Plug](https://github.com/junegunn/vim-plug) is the best option.

2. Install required plugins. For Vim Plug you should put:
   ```vim
   Plug 'prabirshrestha/async.vim'
   Plug 'prabirshrestha/asyncomplete.vim'
   Plug 'prabirshrestha/asyncomplete-lsp.vim'
   Plug 'prabirshrestha/vim-lsp'
   Plug 'mattn/vim-lsp-settings'
   ```
   between `call plug#begin('~/.vim/plugged')` and `call plug#end()` in your
   `.vimrc`.

3. Add these lines to your `.vimrc` as well:
   ```vim
   inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
   inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
   inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
   imap <c-space> <Plug>(asyncomplete_force_refresh)
   ```
   and save all the changes.
   This will enable you to toggle between autocompletion results with tab and
   shift+tab.

4. Reopen Vim and type command `:PlugInstall`, confirm and wait for the install
   to finish.

5. Open any source file, for example a Python one, then run `:LspServerInstall`.
   This command will enable autocompletion and other Language Server Protocol
   features for the type of file you have currently open.
   Be aware that this will perform some installation.

6. Now you should get autocompletion and other language features that are
   available under `:Lsp<someServerCommand>` commands.

## Overview of autocomplete methods and understanding what this is all about

### Completion mechanisms built into Vim

While LSP is the most advanced way of achieving autocompletion (and much more)
you may wonder why it requires so much hustle and what people used to use before
LSP came about.
It's also worth taking a look at the other solutions to understand the wild west of autocompletion as a whole.

The most rudimentary way of having autocompletion is the completion from the
current buffer (current file).
This feature is built into Vim.
This means that after you press ctrl+n Vim will autocomplete given word using
contents of the file you are editing.
This is obviously very primitive and language agnostic.

One step further is a built-in Vim plugin called
[omni completion](https://vim.fandom.com/wiki/Omni_completion)
that is a rather simple way to get anyhow smart completion.
You enable it with `filetype plugin on` and
`set omnifunc=syntaxcomplete#Complete` in your `.vimrc`.
Omni completion is language aware but it's far worse than what you can get in a
modern IDE.
If you use omni completion with compiled languages like C you will have to
create a ctags file which contains information about your code.
It's fairly easy and requires you to run one command on your makefile.
Ctags may be already installed on your system, if not you can get it
from [here](https://ctags.io).
When you have a ctags file in the project Vim will also enable you to jump
tags and navigate code with motions like `ctr+[`.
However omni completion isn't that great and still requires you to invoke it
manually when you want to complete.

### Advanced completion before LSP

Since omni completion some more advanced autocompletion plugins have been
developed.
However because there had been no standard in the world of code completion every
solution was a custom crafted system.
This used to apply not only to autocompletion in Vim but to the completion
engines overall.

Unabatedly the most popular of this kind of solution is the
[youcompleteme](https://github.com/ycm-core/YouCompleteMe) plugin.
Another one of them is [deoplete](https://github.com/Shougo/deoplete.nvim).
These plugins provide features that you would expect of modern day IDE but
they aren't perfect.
As mentioned they are not standardised and seem too big for my taste.
I have used youcompleteme before and it wasn't bad but if you search for a
while you can find a bunch of people struggling with its performance.

### LSP – state of art in autocompletion

However in 2016 Microsoft announced itd Language Server Protocol that would
heavily impact the future of Vim (yeah irony) and many other text editors.
While LSP was developed (and is mainly used) for Visual Studio Code it is an
open standard that introduces some order to the wild west of autocompletion.
The protocol is a universal way of enabling code editors to communicate with a
code analyser (proper name is Language Sever) that can provide them with
advanced features including autocompletion and much more.
LSP introduces standardization and enables client server architecture where each
programming language has a server and code editors are LSP clients.

This separates code editors from code analysis which is definitely better than
having custom baked solution for evry single editor you use.
Using LSP you can choose which language servers you want to use and you your
editor is not strictly bound to the way it gets code analysis.
Other advantage of LSP is that you can easily switch servers for different
languages so your not bound to a single program.
With LSP you can get rich autocompletion, code navigation, refactoring, hovers
and even more with great setup flexibility.

This idea was soon incorporated into Vim and now we can finally take a look at
getting it going inside our instance of Vim.

## Getting LSP work in Vim

First plugin we need is [async](https://github.com/prabirshrestha/async.vim).
Since Vim 8 (which started what we would call modern Vim) the editor is able
to perform asynchronous job executions.
This basically means that some plugins can perform tasks in the background and
react to what is going on in Vim without user having t oexplicitly ask for some
actions.
This is what we need for autocompletion to pop up automatically when we type.
Your Vim should already be above the 8.0 version, but make sure of it if you
want autocompletion to work.
Then we need an async plugin, even though Vim has asynchronous actions built in.
Because Neovim has developed async separately from Vim it has a slightly
different API.
This plugin is required to normalize the APIs so developers can share their
plugins between Vim and Neovim easily (yes relation between Vim and Neovim
is annoying).

Then we need
[asynchronous autocompletion](https://github.com/prabirshrestha/asyncomplete.vim)
plugin.
That will make completion menu pop up automatically using async.
This can be utilized not only with LSP autocompletion but also with previously
mentioned buffer completion and omni completion.
If you want asynchronous autocompletion with different source then LSP read more
about it on GitHub.

Now we have to make the autocompletion use LSP protocol to make Vim be able to
talk with language servers.
There is another [plugin](https://github.com/prabirshrestha/vim-lsp) to make
this work.

There are some other plugins that make Vim be able to perform asynchronous
completion from LSPs but the set of plugins shown here is written and Vim
script, so it should have least dependencies.
Other solutions are
[LanguageClient-neovim](https://github.com/autozimu/LanguageClient-neovim)
(uses Rust), [vim-lsc](https://github.com/natebosch/vim-lsc) (uses Vim script
but seems to be less popular than vim-lsp).
There are also some PRs for Neovim that will make it have LSP support built-in.

The last step is to install language servers for our languages of choice.
LSPs are normal computer programs that will talk to your editor when a code
related service is needed.
You can check out the full list of LSPs on the
[website](https://langserver.org) (it also has list of other LSP clients
then Vim).
After a server is installed it usually requires a few (up to around ten)
lines of config in `.vimrc` to register the server.
However this is rather annoying part of LSPs in Rim because configuring each
server by hand in Vim can be tiring and I feel like what we have already done
is much of a hustle.
Luckily there is a [plugin](https://github.com/mattn/vim-lsp-settings)
for LSPs auto management for Vim.
With it you can simply type `:LspInstallServer` and you will get a server for the
document you are currently editing.

Another nice thing about the setup is that all of the plugins are developed by
the same group of people so compatibilty is kept in mind.

## LSP with Python and C++

Now you can play with LSP for a while.
Python should work out of the box, while C/C++ requires a
`compile_commands.json` file at the root of your project to get most of it.
You can create it with CMake using `set(CMAKE_EXPORT_COMPILE_COMMANDS ON)`.
If you use plain makefiles there is a utility on pip called `compiledb`
that can create `compile_commands.json` with `compiledb make`.

I also recommend putting this line in your `.vimrc`:
`let g:lsp_diagnostics_enabled = 0`, it will disable code diagnostics.
By default LSP will try to find errors and warnings in your code.
I don't like this much stuff happening so I disabled it.

The default LSP for C++ is [clangd](https://clangd.llvm.org) from LLVM project.
From my experience it works very well.
When you install it using `LspInstallServer` it will ask if you want to install
additional clang instance for vim or use the system one.
Having extra clang may be annoying, but on the second thought it is much easier
to maintaining the system if clangd has its own clang independent of your main
one.

The LSP for Python is [pyls](https://github.com/palantir/python-language-server).
I would tell that is more buggy than clangd, however all LSPs are new so we have
to give pyls some time to mature.
Pyls is written in Python, however if you are ok with C# and Dotnet you may want
to give [pyls-ms](https://github.com/microsoft/python-language-server) a try.
This is the Pyton LSP that Visual Studio Code uses by the default.
To get it you have to run `:LspInstallServer pyls-ms`.

## Even more features with Vista

As mentioned LSPs can do much more than just autocompletion.
There is a plugin called [Vista](https://github.com/liuchengxu/vista.vim) that
can give you nice code navigation with LSP.

![Code navigation pane provided by Vista](https://github.com/maciejzj/website/blob/master/media/vim-lsp-and-autocompletion-vista.png?raw=true)

After you install it with Plug i recommend putting these lines in your `.vimrc`.
```vim
let g:vista_executive_for = {
        \ 'cpp': 'vim_lsp',
        \ 'python': 'vim_lsp',
        \ }
let g:vista_ignore_kinds = ['Variable']
```
They will make sure that LSP is used for powering Vista for your languages of
choice.
I have also disabled navigating variables because it is too much for me.
Once Vista is installed you can invoke it with `:Vista`.
