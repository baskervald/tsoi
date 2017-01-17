LUA_FILES = $(wildcard lua/*.lua)

.PHONY : clean

build/main.lua: $(LUA_FILES) mod.lua
	@mkdir -p $(@D)
	cat mod.lua > $@
	for file in $(LUA_FILES); \
	do \
		cat $$file >> $@; \
	done

clean:
	rm -r build
