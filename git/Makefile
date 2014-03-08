
CONFS:=$(wildcard config/*.gitconfig)
CURRENT:=$(shell date +%Y-%m-%dT%H-%M)

check:
	echo gitingorefile: $(PWD)/gitignore.txt
	echo Current: $(CURRENT)

.gitconfig: user.gitconig $(CONFS)
	cat $< | sed "s!%YOU_MUST_REPLACE_HERE%!$(PWD)!" > $@

install: .gitconfig
	mkdir -p backups
	mv $(HOME)/.gitconfig backups/$(CURRENT).gitconfig
	cp $< $(HOME)/

