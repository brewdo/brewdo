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

brewdo is best considered alpha right now; I've successfully run
`brewdo install` in a VM and installed some software from the result.

Installation
----

`brewdo install` expects a system with no current Homebrew install,
though it should work with other software installed in `/usr/local`.
(I haven't fully thought through what it might take to migrate an
existing Homebrew install—see `MIGRATION.md` for current thinking.)

1.  Make sure you have a current system backup, and time to revert to
    it if things go horribly wrong!

2.  Put `brewdo` wherever you like.  Symlinking it into `bin` in
    your home directory while maintaining the script in your git
    clone would not be a bad plan.

3.  Run

        sudo brewdo install

    This will create the Homebrew owner, create the log directory
    `/var/log/homebrew`, and clone Homebrew into `/usr/local`, owned
    by the new owner account.

    (If this step complains that the owner account exists and you
    are sure that's correct, you can run `sudo brewdo deluser` to
    clear it out.)

4.  Finally, you can make brewdo easier to use by adding an alias to
    your `.profile`:

        alias brew='brewdo brew'

    This lets you just say things like `brew install hello` which
    should Just Work.

Commands
----

brewdo supports a number of commands:

-   `brew`: runs Homebrew with the remaining arguments, in a sandbox
    if needed (determined by checking a list).

-   `do`: runs an arbitrary command in the brewdo sandbox.
    `brewdo do sh` is very useful for troubleshooting.

-   `install`: installs Homebrew sandboxed with brewdo.  See
    [Installation](#installation). 

-   `doctor`: like `brew doctor`, this checks up on brewdo's
    installation.

-   `adduser`/`deluser`: adds or removes the system user account
    brewdo uses.  `install` does the `adduser` for you, so you only
    need deal with these for troubleshooting or uninstallation.

How it works
----

brewdo requires a sandbox user account (traditionally `_homebrew`).
This user account is switched to using Sudo whenever you use brewdo
to execute a Homebrew command, unless that command is known to not
require write rights to the Homebrew root (e.g. `help`, `list`).
brewdo also takes care of extra steps required by some formulae,
such as creating (and cleaning up) a temporary home directory for
node.

What brewdo install does
----

Here's a short list of the prerequisites brewdo has for operation.
`brewdo install` takes care of all of this:

-   A sandbox user account (traditionally `_homebrew`); this can
    also be created with

        sudo brewdo adduser

-   A new log directory `/var/log/homebrew` that the sandbox account
    can write to

    (`/var/log/homebrew` was chosen specifically so it would show
    up in the Console app, much like the traditional user logs.)

-   The Homebrew root (traditionally `/usr/local`) set up with write
    rights granted to the sandbox account

Sudo configuration
----

`brewdo install` formerly added a Sudo configuration, but in fact,
that proved to be unnecessary as the default configuration (which
allows members of the `admin` group to perform any actions as any
user) worked with the subprocess scheme `brewdo` used.  If you wish
to allow other users to use `brewdo` or have a different Sudo
configuration, a line like this will do the job:

    %admin  ALL=(_homebrew) /usr/local/bin/brew

Consult
[`sudoers(5)`](https://developer.apple.com/library/mac/documentation/Darwin/Reference/Manpages/man5/sudoers.5.html)
for more information.

