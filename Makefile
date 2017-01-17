LUA_FILES = $(wildcard lua/*.lua)
BASE_RES = res
XML_CONTENT = $(wildcard $(BASE_RES)/content/*.xml)
RESOURCES = $(wildcard $(BASE_RES)/resources/*)

.PHONY : clean

build: build/main.lua build/resources build/content

build/main.lua: $(LUA_FILES) mod.lua
	@echo "MAIN.LUA"
	@mkdir -p $(@D)
	cat mod.lua > $@
	for file in $(LUA_FILES); \
	do \
		cat $$file >> $@; \
	done

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
