CFLAGS+=-O2 -Wall

all: freefall

freefall: freefall.c
	$(CC) $(CFLAGS) freefall.c -o $@

clean:
	rm -f freefall

install: all
	mkdir -p $(DESTDIR)/etc/init $(DESTDIR)/usr/sbin
	cp -a freefall.conf $(DESTDIR)/etc/init/
	cp -a freefall $(DESTDIR)/usr/sbin/
