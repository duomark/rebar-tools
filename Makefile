gc:
	@echo -n 'Removing all emacs archive files... '
	@rm -f *~
	@rm -f */*~
	@echo 'done'

setup:
	@echo -n 'Setting up deps/rebar-tools as a symbolic link for local testing... '
	@mkdir -p deps
	@[[ -s deps/rebar-tools ]] || ln -s ../.. deps/rebar-tools
	@echo 'done'

clean: gc clean_src clean_deps

clean_src:
	@echo -n 'Removing local generated source code... '
	@rm -rf src
	@echo 'done'

clean_deps:
	@echo -n 'Removing local testing deps/rebar-tools symbolic link... '
	@rm -rf deps
	@echo 'done'
