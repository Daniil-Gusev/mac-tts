BINARY_NAME = mactts
quick: debug

release: clean
	@swift build -c release 

debug: clean
	@swift build 

tidy:
	@swift-format Package.swift > temp
	@cp temp Package.swift
	@swift-format Sources/SwiftMacPackage/logger.swift > temp
	@cp temp Sources/SwiftMacPackage/logger.swift 
	@swift-format Sources/SwiftMacPackage/statestore.swift > temp
	@cp temp Sources/SwiftMacPackage/statestore.swift 
	@swift-format Sources/SwiftMacPackage/main.swift > temp
	@cp temp Sources/SwiftMacPackage/main.swift 
	@rm temp

clean:
	@swift package clean
	@rm -rf .build
	@rm -rf Package.resolved

GITHUB_USER = Daniil-Gusev
REPO_NAME = mac-tts
LATEST_RELEASE_URL = https://api.github.com/repos/$(GITHUB_USER)/$(REPO_NAME)/releases/latest
DOWNLOAD_URL = $(shell curl -s $(LATEST_RELEASE_URL) | grep "browser_download_url" | cut -d '"' -f 4)

.PHONY: download_latest_release
download-latest-release:
	@echo "Fetching latest release download URL..."
	@echo "Latest release URL: $(DOWNLOAD_URL)"
	@echo "Downloading latest release..."
	@curl -L -o latest-release.tar.gz $(DOWNLOAD_URL)
	@echo "Download complete. Saved as latest-release.tar.gz"

install-binary: download-latest-release
	@tar -zxf latest-release.tar.gz
	@rm latest-release.tar.gz

install: release
	@echo "Installing $(BINARY_NAME) to /usr/local/bin..."
	@mkdir -p /usr/local/bin
	@cp .build/release/$(BINARY_NAME) /usr/local/bin/$(BINARY_NAME)
	@chmod +x /usr/local/bin/$(BINARY_NAME)
	@echo "Installation complete."

uninstall:
	@echo "Uninstalling $(BINARY_NAME)..."
	@if [ -f /usr/local/bin/$(BINARY_NAME) ]; then rm /usr/local/bin/$(BINARY_NAME); fi
	@echo "Uninstallation complete."