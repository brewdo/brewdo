Thoughts on migration to brewdo
====

Obviously, a lot of people already use Homebrew.  brewdo currently
supports a clean installation.  But it would be nice to be able to
sandbox an existing Homebrew installation.

This is tricky because some software's expectations are changed a
little.  (This was even part of the original motivation for brewdo!)
Take, for example, Python and pip.  Running `pip install package`
in a standard Homebrew install will install to `/usr/local`, but
brewdo doesn't allow that, by design.  So there could concievably
be things in `/usr/local` that Homebrew never installed; should
those also be migrated?

I have a couple thoughts for how to implement migrations, and am
undecided as to which.  Feedback is welcome.

Dump and load
----

I did this when I first started [the
experiment](https://www.zigg.com/2014/sandboxing-homebrew.html):

1.  `brew list >brew-list`

2.  Nuke Homebrew's `/usr/local` contents from orbit

3.  Set up brewdo

4.  ``brewdo brew install `cat brew-list```

This is definitely going to be the cleanest option, but it does
require time and possibly manual lifting of other inhabitants of
`/usr/local`.

Ownership change
----

Not yet tried, but it seems reasonable that anything in `/usr/local`
that my user account owns was probably put there by Homebrew (though
it could also have been put there by a rogue `pip install` or
similar!)

Thus, we could concievably get a working, though possibly not
entirely clean, migration by simply changing ownership on everything
in `/usr/local` owned by the user.  Since `/usr/local` isn't generally
writable by user accounts except via Homebrew, it seems unlikely
this will mangle ownership on unintended things.

