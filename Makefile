SWIFT_LINT := swiftlint
XCODE_BUILD := xcodebuild

PROJECT_NAME := "Unlocker"

SRC := $(find Sources -name "*.swift")

RELEASEDIR := Release

.DEFAULT_GOAL := build

.PHONY: lint
lint:
	$(SWIFT_LINT) lint

.PHONY: build
build: .build/debug/unlocker

.build/debug/unlocker: $(SRC)
	swift build

.PHONY: archive
archive:

.PHONY: clean
clean:
	@rm -rf .build
	@rm -rf DerivedData
	@rm -rf $(RELEASEDIR)
