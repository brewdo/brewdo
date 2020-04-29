brewdo
======

brewdo is a wrapper for [Homebrew](http://brew.sh/) that sandboxes the
installation process, giving you the following advantages:

-   Your user account loses write rights to `/usr/local`, making
    it much harder to accidentally break your Homebrew-installed
    software (or other `/usr/local` software)

-   Software installations lose write rights to your home directory
    and other places outside `/usr/local`, blocking those installations
    from modifying things they're not supposed to

-   You can cleanly share Homebrew admin rights among multiple users
    of the same system

brewdo uses `sudo(1)`, but not to run commands as `root`; rather, to
run Homebrew under a dedicated sandbox user account.

brewdo grew out of the experiment in my blog post, [Sandboxing
Homebrew](https://www.zigg.com/2014/sandboxing-homebrew.html).

Status
----

brewdo works and I use it personally, but I do recommend you make
sure your system is backed up before running `brewdo install` or
`brewdo switch`.

brewdo has been tested on:

-   macOS 10.13 High Sierra (primary development platform)
-   macOS 10.11 El Capitan

In the past, brewdo was also tested as far back as macOS 10.8 Mountain
Lion, and I think it should still work there.

Installation
------------

If you have a new system with no `/usr/local` at all, you can install
brewdo by first running `sudo ./brewdo install` in your Git clone; this
will set up the sandbox user and Homebrew into a new `/usr/local`.
When this is done, you can optionally run `./brewdo do make install` to
install the `brewdo` program and its man page into `/usr/local` so you
can use it across your whole system.

You can also run `brewdo` directly out of your Git clone; the program
is an entirely self-contained script. `brewdo.1.ronn` is the
[Ronn](http://rtomayko.github.io/ronn/)-formatted man page for `brewdo`
that you can read directly to get information on using the program.

How it works
------------

brewdo requires a sandbox user account (traditionally `_homebrew`).
This user account is switched to using Sudo whenever you use brewdo
to execute a Homebrew command, unless that command is known to not
require write rights to the Homebrew root (e.g. `help`, `list`).
The environment is set so that brewdo-wrapped Homebrew uses the new
system-wide log directory (`/var/log/homebrew`, which was chosen
because Console.app finds it transparently).
brewdo also takes care of extra steps required by some formulae,
such as creating (and cleaning up) a temporary home directory.

Related projects
----------------

- James McMeeking has adapted the Homebrew sandboxing aspect of
  this project for use via MDM [here](https://github.com/mcmeeking/brewdo).

