ifeq ($(INSTALL),)
	INSTALL := /usr/bin
endif
ifdef $(DESTDIR)
	DESTDIR := $(DESTDIR)/
endif
$(eval INSTALL := $(shell if [ -n "$$(sh -c 'echo "$$ANDROID_ROOT"')" ]; then echo /data/data/com.termux/files/usr/bin; else echo $(INSTALL); fi))

install:
	install -Dm755 artzip $(DESTDIR)$(INSTALL)/artzip
	install -Dm755 artzip_gen_sed_random $(DESTDIR)$(INSTALL)/azsed
	ln -s artzip $(DESTDIR)$(INSTALL)/az

remove:
	rm $(DESTDIR)$(INSTALL)/artzip
	rm $(DESTDIR)$(INSTALL)/azsed
	rm $(DESTDIR)$(INSTALL)/az
