Changelog
=========

1.0
---

-   Initial release.

2.0
---

-   Modified chdir behavior.  Formerly, brewdo would unconditionally
    change to the root directory before switching to the sandbox user
    and performing sandbox actions.  Now, after switching to the
    sandbox user, brewdo tests to see if it can chdir to the current
    working directory, and only changes to the root directory if it
    cannot.  Fixes issue #7.

-   Minor documentation updates.

2.0.1
-----

-   Updated documentation and Vagrant setups for Yosemite and Mavericks
    support.

-   Updated documentation with a working installation routine (sorry
    about that!)  Fixes issue #10.

2.0.2
-----

-   Updated documentation and Vagrant setups for El Capitan.

-   Fixed switch behavior so that it no longer follows symlinks.
    This both stops it from erroring on dangling symlinks and keeps
    it from following symlinks out of the Homebrew home.

2.0.3
-----

-   Fixed mktemp call to use an absolute path to avoid using non-macOS
    versions of mktemp that may be on a user's PATH.  Fixes issue #16.

2.1.0
-----

-   Restored compatibility with latest version of Homebrew.

-   Improved handling of pre-existing `_homebrew` user and brew cache during
    install.

-   Added basic support and install notice for Homebrew Cask users.

-   Tested on macOS High Sierra and Mojave.
