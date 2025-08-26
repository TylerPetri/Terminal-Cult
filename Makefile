PACKAGE=wand-ritual
VERSION=1.0
BUILD_DIR=$(PACKAGE)-deb
DEB=$(PACKAGE)_$(VERSION).deb

all: build

build:
	mkdir -p $(BUILD_DIR)/DEBIAN
	mkdir -p $(BUILD_DIR)/usr/local/bin
	cp wand.sh $(BUILD_DIR)/usr/local/bin/
	chmod 755 $(BUILD_DIR)/usr/local/bin/wand.sh
	echo "Package: $(PACKAGE)" > $(BUILD_DIR)/DEBIAN/control
	echo "Version: $(VERSION)" >> $(BUILD_DIR)/DEBIAN/control
	echo "Section: utils" >> $(BUILD_DIR)/DEBIAN/control
	echo "Priority: optional" >> $(BUILD_DIR)/DEBIAN/control
	echo "Architecture: all" >> $(BUILD_DIR)/DEBIAN/control
	echo "Depends: bash, figlet, toilet, lolcat, cowsay" >> $(BUILD_DIR)/DEBIAN/control
	echo "Maintainer: Terminal Cult <noreply@terminal.cult>" >> $(BUILD_DIR)/DEBIAN/control
	echo "Description: Ritual shell script from the Terminal Cult" >> $(BUILD_DIR)/DEBIAN/control
	echo " A sacred invocation tool with figlet, lolcat, and cowsay. You are the spell." >> $(BUILD_DIR)/DEBIAN/control
	dpkg-deb --build $(BUILD_DIR) $(DEB)

clean:
	rm -rf $(BUILD_DIR) *.deb