datadir = $(shell pwd)
srcdir = src
destdir = jaf7c7.github.io
srcfiles = $(wildcard $(srcdir)/*.md)
destfiles = $(patsubst $(srcdir)/%.md,$(destdir)/%.html,$(srcfiles))

all: destdir $(destfiles) format

format:
	prettier --write $(destdir)

$(destfiles): $(destdir)/%.html: $(srcdir)/%.md
	pandoc \
		--verbose \
		--data-dir $(datadir) \
		--defaults base \
		--output $@ \
		$<

destdir:
	test -d $(destdir) || mkdir $(destdir)

clean:
	rm -r $(destdir)
