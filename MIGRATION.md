Thoughts on migration to brewdo
====

Obviously, a lot of people already use Homebrew.  brewdo currently
supports a clean installation.  But it would be nice to be able to
migrate an existing Homebrew installation to brewdo.

This is tricky because some software's expectations are changed a
little.  (This was even part of the original motivation for brewdo!)
Take, for example, Python and pip.  Running `pip install package`
in a standard Homebrew install will install to `/usr/local`, but
brewdo doesn't allow that, by design.  So there could concievably
be things in `/usr/local` that Homebrew never installed; should
those also be migrated?

Here are some ideas.

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

It also [doesn't carry forward package options]
(https://github.com/zigg/brewdo/issues/1#issuecomment-46171085) as
implemented above, but we could concievably write code that peeks
in all the install receipts to build a script that does reapply
build options.  Even with *that*, though, it's plausible that
someone has old brewed installs that are no longer available or
available in an incompatible form.

While I personally like this method, it seems like it would be
the least safe one.

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

This is both easily implementable and easily reversible.  I think it
has potential as brewdo's default migration method, even if it results
in a potentially unclean installation—everything should still *work*,
and that's the most important bit.

