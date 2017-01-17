LUA_FILES = $(wildcard lua/*.lua)
BASE_RES = res
XML_CONTENT = $(wildcard $(BASE_RES)/content/*.xml)
RESOURCES = $(wildcard $(BASE_RES)/resources/*)

.PHONY : clean install

build: build/main.lua build/resources build/content

build/main.lua: $(LUA_FILES) main.lua
	@echo "MAIN.LUA"
	@mkdir -p $(@D)
	python3 modrequire.py main.lua build/main.lua

build/resources: $(RESOURCES)
	@echo "RESOURCES"
	cp -r $(BASE_RES)/resources $@

build/content: $(XML_CONTENT)
	@echo "CONTENT"
	@mkdir -p $@
	for xmlfile in $(XML_CONTENT); \
	do \
		cp $$xmlfile $@; \
	done

clean:
	@echo "CLEAN"
	rm -r build

install: build
	@echo "INSTALL"
	cp -rf build ~/.local/share/binding\ of\ isaac\ afterbirth+\ mods/
