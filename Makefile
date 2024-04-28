NPROCS := $(shell nproc)
MAKEFLAGS += -j$(NPROCS)
SHELL := /bin/bash

# Removing artifacts after build
clean:
	@rm -rf dotload_*.deb dotload_*.snap dotload_*.build dotload_*.buildinfo dotload_*.changes dotload_*.dsc dotload_*.tar.xz

# Installing the tool
install:
	./install.sh

# Remove the tool
uninstall:
	sudo rm "${PREFIX}/bin/dotload"
	hash -r

# Creating a deb package
deb-package:
	@cd dotload; \
	if [[ "$(WORKFLOW)" = "true" ]]; then \
		export DEBEMAIL="$(EMAIL)"; \
		export DEBFULLNAME="$(FULLNAME)"; \
		dch --create --distribution noble --package dotload --newversion "$(VERSION)" "$(CHANGES)"; \
		debuild --no-lintian -i -p"gpg --passphrase $(PASSPHRASE) --pinentry-mode loopback" -k$(KEY); \
		debuild --no-lintian -S -sa -p"gpg --passphrase $(PASSPHRASE) --pinentry-mode loopback" -k$(KEY); \
	else \
		debuild --no-lintian -us -uc; \
	fi

# Creating a snap package
snap-package:
	@# Create version in snapcraft.yaml
	@sed -i "s/@@VERSION@@/$(VERSION)/g" snap/snapcraft.yaml

	@if [[ "$(WORKFLOW)" = "true" ]]; then \
		sg lxd -c 'snap run snapcraft clean'; \
		sg lxd -c 'snap run snapcraft --verbose'; \
	else \
		snapcraft clean; \
		snapcraft --verbose; \
	fi

	@sed -i "s/$(VERSION)/@@VERSION@@/g" snap/snapcraft.yaml

all: deb-package snap-package

.PHONY: clean install uninstall deb-package snap-package all