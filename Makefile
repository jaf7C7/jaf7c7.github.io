srcdir = src
srcfiles = $(shell find $(srcdir) -name \*.md)
destdirs = $(subst $(srcdir)/,,$(sort $(dir $(srcfiles))))
destfiles = $(srcfiles:$(srcdir)/%.md=%.html)

all: destdirs $(destfiles) format

destdirs:
	@echo 'building...'
	@mkdir -p $(destdirs)

$(destfiles): %.html: $(srcdir)/%.md
	@echo $@
	@pandoc --data-dir . \
		--defaults base \
		--verbose \
		--output $@ \
		$<

format:
	@echo 'formatting...'
	@prettier --write $(destfiles)

clean:
	@echo 'cleaning up...'
	@rm -r $(destdirs) *.html
