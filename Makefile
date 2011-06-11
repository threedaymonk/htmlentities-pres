.PHONY: all vendor dirs

all: vendor data.js

vendor: dirs data.js vendor/sh_main.min.js vendor/sh_ruby.min.js vendor/jquery.min.js

dirs:
	mkdir -p vendor

vendor/sh_main.min.js:
	curl -o vendor/sh_main.min.js http://shjs.sourceforge.net/sh_main.min.js

vendor/sh_ruby.min.js:
	curl -o vendor/sh_ruby.min.js http://shjs.sourceforge.net/lang/sh_ruby.min.js

vendor/jquery.min.js:
	curl -o vendor/jquery.min.js http://code.jquery.com/jquery-1.6.1.min.js

data.js: source.txt presentation.rb
	ruby presentation.rb < source.txt > data.js
