NPROCS = $(nproc)
MAKEFLAGS += -j$(NPROCS)
SHELL:=/bin/bash

clean:
	@rm -rf dotload_*.deb dotload_*.snap dotload_*.build dotload_*.buildinfo dotload_*.changes dotload_*.dsc dotload_*.tar.xz

# weird piece of shit
deb:
	@cd dotload;\
	if [ "$(WORKFLOW)" = "true" ]; then \
		export DEBEMAIL="$(EMAIL)";\
		export DEBFULLNAME="$(FULLNAME)";\
		dch --create --distribution jammy --package dotload --newversion "$(VERSION)" "$(CHANGES)";\
		debuild --no-lintian -i -p"gpg --batch --passphrase $(PASSPHRASE) --pinentry-mode loopback" $(KEY);\
		debuild --no-lintian -S -sa -p"gpg --batch --passphrase $(PASSPHRASE) --pinentry-mode loopback" $(KEY);\
	else\
		debuild --no-lintian;\
	fi

snap-package:
	@sed -i "s/@@VERSION@@/$(VERSION)/g" snap/snapcraft.yaml
	@snapcraft clean
	@snapcraft --verbose
	@sed -i "s/$(VERSION)/@@VERSION@@/g" snap/snapcraft.yaml

all:
	@$(MAKE) deb snap-package -j$(nproc)

.PHONY: clean deb snap-package all build-all