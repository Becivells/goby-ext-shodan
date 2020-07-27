
NAME=goby-ext-shodan

VERSION_TAG := $(shell git describe --tags --always)
VERSION_VERSION := $(shell git log --date=iso --pretty=format:"%cd" -1) $(VERSION_TAG)
VERSION_COMPILE := $(shell date +"%F %T %z")
VERSION_BRANCH  := $(shell git rev-parse --abbrev-ref HEAD)
VERSION_GIT_DIRTY := $(shell git diff --no-ext-diff 2>/dev/null | wc -l|sed 's/^[ \t]*//g')
VERSION_DEV_PATH:= $(shell pwd)
BUILD_TIME=`date +%Y%m%d%H%M`
COMMIT_VERSION=`git rev-parse HEAD`
COLOR_ENABLE=$(shell tput colors > /dev/null; echo $$?)
ifeq "$(COLOR_ENABLE)" "0"
CRED=$(shell echo "\033[91m")
CGREEN=$(shell echo "\033[92m")
CYELLOW=$(shell echo "\033[93m")
CEND=$(shell echo "\033[0m")
endif

.PHONY: package
package:
	@echo "$(CGREEN)Package ...$(CEND)"
	@rm -rf package
	@mkdir -p package
	@git archive --format=zip HEAD ":!.gitignore" ":!.idea" ":!Makefile" -o package/$(NAME)-$(VERSION_TAG)-$(VERSION_BRANCH)-$(VERSION_GIT_DIRTY)-$(BUILD_TIME).zip
	@echo "$(CGREEN)Package End...$(CEND)"
