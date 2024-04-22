NPROCS = $(nproc)
MAKEFLAGS += -j$(NPROCS)
SHELL:=/bin/bash

clean:
	@rm -rf dotload_*.deb dotload_*.snap dotload_*.build dotload_*.buildinfo dotload_*.changes dotload_*.dsc dotload_*.tar.xz

install:
	@echo -e "\n\e[1mInstalling...\e[0m"

	@if echo "${OSTYPE}" | grep -qE '^linux-android.*'; then \
		cp dotload/bin/dotload "${PREFIX}/bin";\
	else\
		sudo cp dotload/bin/dotload "${PREFIX}/bin";\
	fi

	@echo -e "dotload/bin/dotload \e[30m->\e[0m ${PREFIX}/bin"

	@echo -e "\n\e[1;32mDone!\e[0m"

uninstall:
	sudo rm ${PREFIX}/bin/dotload
	hash -r

# weird piece of shit
deb-package:
	@cd dotload;\
	if [ "$(WORKFLOW)" = "true" ]; then \
		export DEBEMAIL="$(EMAIL)";\
		export DEBFULLNAME="$(FULLNAME)";\
		dch --create --distribution jammy --package dotload --newversion "$(VERSION)" "$(CHANGES)";\
		debuild --no-lintian -i -p"gpg --batch --passphrase $(PASSPHRASE) --pinentry-mode loopback" -k$(KEY);\
		debuild --no-lintian -S -sa -p"gpg --batch --passphrase $(PASSPHRASE) --pinentry-mode loopback" -k$(KEY);\
	else\
		debuild --no-lintian;\
	fi

snap-package:
	@sed -i "s/@@VERSION@@/$(VERSION)/g" snap/snapcraft.yaml
	@if [ "$(WORKFLOW)" = "true" ]; then \
		sg lxd -c 'snap run snapcraft clean';\
		sg lxd -c 'snap run snapcraft --verbose';\
	else\
		snapcraft clean;\
		snapcraft --verbose;\
	fi
	@sed -i "s/$(VERSION)/@@VERSION@@/g" snap/snapcraft.yaml

all:
	@$(MAKE) deb-package snap-package -j$(nproc)

.PHONY: clean deb-package snap-package all