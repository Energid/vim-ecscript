ecscript.vim
============

If you are an Actin EcScript user who uses Vim or Gvim for editing scripts, 
then this plugin is for you.

It provides nice syntax coloring and indenting for EcScript (.ecs)
files, and also includes a filetype plugin so Vim can autodetect your scripts.

Installation
------------

Copy the included directories into your .vim or vimfiles directory.

Alternatively, use [pathogen.vim][1] and pull it in like this:

    cd ~/.vim/bundle
    git clone https://github.com/Energid/vim-ecscript.git

Or you can use [vundle.vim][2], add the following line to your .vimrc, and
then call `:PluginInstall`:

    Plugin 'Energid/vim-ecscript'

Folding
-------

The ecscript syntax file provides syntax folding for script blocks.

When 'foldmethod' is set to "syntax" then matching sets of parentheses
will be folded.

Parentheses Counting
--------------------

This plugin supports flagging any excess closing parentheses in script
files as errors.

To enable this feature, add the following line to your .vimrc:

    :let g:ecs_check_parens = 1

Note: Parentheses counting might slow down syntax highlighting significantly,
especially for large files.

Deprecated Keywords
-------------------

This plugin also supports flagging deprecated EcScript commands as errors.

This feature is enabled by default. To disable it, add the following line
to your .vimrc:

    :let g:ecs_warn_deprecated = 0

RCF Extensions
--------------

EcScript extensions defined by the Robot Control Framework (RCF) library are
highlighted by default.

To disable this highlighting, add the following line to your .vimrc:

    :let g:ecs_rcf_extensions = 0

Actin Extensions
----------------

EcScript extensions defined by the Actin Extensions library are highlighted
by default.

To disable this highlighting, add the following line to your .vimrc:

    :let g:ecs_actin_extensions = 0

UR Extensions
-------------

EcScript extensions defined by the Actin UR library are not highlighted
by default.

To enable this highlighting, add the following line to your .vimrc:

    :let g:ecs_ur_extensions = 1

Comments and Suggestions
------------------------

Please follow, fork or submit issues on [GitHub][3].

License
-------

    MIT License

    Copyright (c) 2019-2020 Energid Technologies

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

Version History
---------------

* v2.0 (2020-10-06) Updated syntax for Actin 6.0 release.
* v1.3 (2020-04-30) Tweaked highlighting of deprecated commands.
* v1.2 (2020-03-19) Fixed bug allowing `TODO` highlighting outside of comments.
* v1.1 (2019-12-18) Added `rrt_plan` and `find_solution` param highlighting; fixed tag file.
* v1.0 (2019-12-10) Initial release

[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/VundleVim/Vundle.vim
[3]: https://github.com/Energid/vim-ecscript
