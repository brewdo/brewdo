Contributing
====

Please submit pull requests against the `develop` branch.

Feature branches a la [git-flow](https://github.com/nvie/gitflow) would
be awesome!

Manual
----

The manual is written in [ronn](https://rtomayko.github.io/ronn/)
format, but we distribute the roff output too to simplify installation.
If you submit a pull request for the manual, please also run `make`
to build `ronn.1` and include it in the pull request.

Development
----

I test brewdo with OS X [Vagrant](https://www.vagrantup.com/) boxes
created from Tim Sutton's
[osx-vm-templates](https://github.com/timsutton/osx-vm-templates/).
This keeps me from inadvertently destroying the `/usr/local` I
actually depend on day-to-day.  If you're developing a new feature
that touches brewdo's machinery, I recommend you go this route too.

