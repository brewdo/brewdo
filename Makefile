PREFIX =	/usr/local
BINDIR =	$(PREFIX)/bin
MANDIR =	$(PREFIX)/share/man
MAN1DIR =	$(MANDIR)/man1

INSTALL =	install -o root -g wheel
RONN =		ronn

BIN =		brewdo
MANPAGE =	brewdo.1

$(MANPAGE): $(MANPAGE).ronn
	$(RONN) -r $<

install: $(BIN) $(MANPAGE)
	$(INSTALL) -d $(BINDIR) $(MAN1DIR)
	$(INSTALL) $(BIN) $(BINDIR)
	$(INSTALL) -m 0644 $(MANPAGE) $(MANDIR)/man1
