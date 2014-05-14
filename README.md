brewdo
====

brewdo is a wrapper for [Homebrew](http://brew.sh/) that sandboxes the
installation process, giving you the following advantages:

-   Your user account loses the rights to `/usr/local`, making it
    much harder to accidentally break your Homebrew-installed
    software (or other `/usr/local` software!)

-   Software installations lose the rights to your home directory,
    meaning software will never partially install into your home
    directory

-   A clean way to share Homebrew admin rights among multiple users
    of the same system

brewdo uses [Sudo](http://www.sudo.ws/), but not to run commands
as `root`; rather, to run Homebrew under a dedicated sandbox user
account.

brewdo grew out of the experiment in my blog post, [Sandboxing
Homebrew](https://www.zigg.com/2014/sandboxing-homebrew.html).

Status
----

brewdo is still in early development and installation code is not yet
present.  As of right now, it can be used to wrap the `brew` command,
but requires unimplemented extra setup (see "What is needed" below).

How it works
----

brewdo requires a sandbox user account (traditionally `_homebrew`).
This user account is switched to using Sudo whenever you use brewdo
to execute a Homebrew command, unless that command is known to not
require write rights to the Homebrew root (e.g. `help`, `list`).
brewdo also takes care of extra steps required by some formulae,
such as creating (and cleaning up) a temporary home directory for
node.

What is needed
----

Here's a short list of the prerequisites brewdo has for operation.
Eventually, brewdo will have its own command for setting these up:

-   A sandbox user account (traditionally `_homebrew`)

-   A Sudo configuration in `/etc/sudoers` for the switch, e.g.

        %admin  ALL=(_homebrew) SETENV: /usr/local/bin/brew

-   A new log directory `/var/log/homebrew` that the sandbox account
    can write to

-   The Homebrew root (traditionally `/usr/local`) set up with write
    rights granted to the sandbox account

Optionally, you can simplify use of brewdo with the following alias:

    alias brew='brewdo brew'

