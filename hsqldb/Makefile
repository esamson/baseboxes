all: clean deps provision package.box
	@echo hsqldb box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/hsqldb-2.3.2.zip
	@echo Dependencies are in .deps/

.deps/hsqldb-2.3.2.zip: .deps
ifeq ("$(wildcard .deps/hsqldb-2.3.2.zip)", "")
	$(info hsqldb-2.3.2.zip needs to be downloaded manually and added to .deps/)
	$(info Download from http://sourceforge.net/project/showfiles.php?group_id=23316)
	$(error .deps/hsqldb-2.3.2.zip missing)
endif

.deps:
	@echo Creating .deps/ dir
	mkdir .deps

provision:
	vagrant up
	vagrant ssh -c ./free-up-disk.sh
	vagrant ssh -c "rm free-up-disk.sh"
	vagrant halt

package.box:
	vagrant package --base hsqldb

