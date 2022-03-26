SWIFT_LINT := swiftlint
XCODE_BUILD := xcodebuild
SWIFT := swift

SRC := $(find Sources -name "*.swift")

RELEASEDIR := Release
BUILD_DIR := .build
BUILD_RELEASE_DIR := .build/release

.DEFAULT_GOAL := build

.PHONY: lint
lint:
	$(SWIFT_LINT) lint

.PHONY: build
build: .build/debug/unlocker

.build/debug/unlocker: $(SRC)
	$(SWIFT) build

.PHONY: archive
archive: clean
	$(SWIFT) build -c release 
	zip $(BUILD_RELEASE_DIR)/unlocker.zip $(BUILD_RELEASE_DIR)/unlocker

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(RELEASEDIR)
	@rm -rf DerivedData
