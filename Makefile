PREFIX =	/usr/local/
BINDIR =	$(PREFIX)/bin/
MANDIR =	$(PREFIX)/share/man/
MAN1DIR =	$(MANDIR)/man1/

INSTALL =	install -o root -g wheel
RONN =		ronn
GEM =		gem

BIN =		brewdo
MANPAGE =	brewdo.1

$(MANPAGE): $(MANPAGE).ronn
	$(RONN) -r $<

install: $(BIN) $(MANPAGE)
	$(GEM) install colorize
	$(INSTALL) $(BIN) $(BINDIR)
	mkdir -p $(MAN1DIR)
	$(INSTALL) -m 0644 $(MANPAGE) $(MAN1DIR)
