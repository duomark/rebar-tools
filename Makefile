.SUFFIXES :
.SUFFIXES : .temp .template

TDIR := templates
TSRC := temp
TSUFF := template

.temp.template :
	cat ${TDIR}/custom.vars $< > $*.${TSUFF}

TEMPLATES := ${TDIR}/application.${TSUFF} ${TDIR}/gen_fsm.${TSUFF}

all : ${TEMPLATES}

gc:
	@echo -n 'Removing all emacs archive files... '
	@rm -f *~
	@rm -f */*~
	@echo 'done'

clean: gc clean_src clean_test clean_templates

clean_src:
	@echo -n 'Removing local generated source code... '
	@rm -rf src
	@echo 'done'

clean_test:
	@echo -n 'Removing local generated test code... '
	@rm -rf test
	@echo 'done'

clean_templates:
	@echo -n 'Removing custom generated templates... '
	@rm -f templates/*.template
	@echo 'done'
