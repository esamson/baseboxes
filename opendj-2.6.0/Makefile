all: clean deps provision package.box
	@echo opendj box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/OpenDJ-2.6.0.zip
	@echo Dependencies are in .deps/

.deps/OpenDJ-2.6.0.zip: .deps
ifeq ("$(wildcard .deps/OpenDJ-2.6.0.zip)", "")
	$(info OpenDJ-2.6.0.zip needs to be downloaded manually and added to .deps/)
	$(info Download from https://backstage.forgerock.com/#!/downloads/OpenDJ)
	$(error .deps/OpenDJ-2.6.0.zip missing)
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
	vagrant package --base opendj-2.6.0

