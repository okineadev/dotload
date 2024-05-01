NPROCS := $(shell nproc)
MAKEFLAGS += -j$(NPROCS)
SHELL := /bin/bash

# Removing artifacts after build
clean:
	./scripts/clean.sh

# Installing the tool
install:
	./install.sh

# Remove the tool
uninstall:
	sudo rm "${PREFIX}/bin/dotload"
	hash -r

# Creating a deb package
deb-package:
	@./scripts/deb-package.sh $(ARGS)

# Creating a snap package
snap-package:
	./scripts/snap-package.sh $(ARGS)

all: deb-package snap-package

.PHONY: clean install uninstall deb-package snap-package all