brewdo
====

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

brewdo uses sudo(1), but not to run commands as `root`; rather, to
run Homebrew under a dedicated sandbox user account.

brewdo grew out of the experiment in my blog post, [Sandboxing
Homebrew](https://www.zigg.com/2014/sandboxing-homebrew.html).

Status
----

brewdo works and I use it personally, but I do recommend you make
sure your system is backed up before running `brewdo install` or
`brewdo switch`.

brewdo has been tested on:

-   OS X 10.10 Yosemite (primary development platform)

-   OS X 10.9 Mavericks

In the past, brewdo was also tested on OS X 10.8 Mountain Lion, and
should still work there.

Installation
----

Run `make install` to install brewdo and its manual page.  Or run
it directly out of your Git clone; your choice.  Directions for
either installing a brand-new Homebrew installation or switching an
existing one to brewdo are in the manual page.

How it works
----

brewdo requires a sandbox user account (traditionally `_homebrew`).
This user account is switched to using Sudo whenever you use brewdo
to execute a Homebrew command, unless that command is known to not
require write rights to the Homebrew root (e.g. `help`, `list`).
The environment is set so that brewdo-wrapped Homebrew uses the new
system-wide log directory (`/var/log/homebrew`, which was chosen
because Console.app finds it transparently).
brewdo also takes care of extra steps required by some formulae,
such as creating (and cleaning up) a temporary home directory.

