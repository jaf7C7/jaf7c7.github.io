srcdir = src
srcfiles = $(shell find $(srcdir) -name \*.md)
destfiles = $(patsubst $(srcdir)/%.md,%.html,$(srcfiles))

all: $(destfiles) format

$(destfiles): %.html: $(srcdir)/%.md
	pandoc --data-dir . \
		--defaults base \
		--verbose \
		--output $@ \
		$<

format:
	prettier --write $(destdir)

clean:
	rm -r $(destdir) index.html
