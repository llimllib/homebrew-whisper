.PHONY: edit
edit:
	nvim /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/libwhisper.rb

.PHONY: audit
audit:
	brew audit --new libwhisper

.PHONY: install
install:
	brew install --build-from-source libwhisper

.PHONY: install
uninstall:
	- brew uninstall libwhisper

.PHONY: test
test:
	/usr/bin/clang test.c -I/opt/homebrew/Cellar/libwhisper/1.4.0/include -L/opt/homebrew/Cellar/libwhisper/1.4.0/lib -lwhisper -o test
	./test
	brew test libwhisper

