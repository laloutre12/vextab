NODE_BIN := $(shell npm bin)
BOWER_INSTALLER := $(NODE_BIN)/bower-installer
DOCPAD := $(NODE_BIN)/docpad

build: src/files/bower_components
	$(DOCPAD) generate

run: src/files/bower_components
	$(DOCPAD) run

src/files/bower_components:
	$(BOWER_INSTALLER)

