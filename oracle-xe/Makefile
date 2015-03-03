all: clean deps provision package.box
	@echo oracle-xe box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
	@echo Dependencies are in .deps/

.deps/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm: .deps/oracle-xe-11.2.0-1.0.x86_64.rpm.zip
	unzip -o .deps/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d .deps

.deps/oracle-xe-11.2.0-1.0.x86_64.rpm.zip: .deps
ifeq ("$(wildcard .deps/oracle-xe-11.2.0-1.0.x86_64.rpm.zip)", "")
	$(info oracle-xe-11.2.0-1.0.x86_64.rpm.zip needs to be downloaded manually and added to .deps/)
	$(info Download from http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html)
	$(error .deps/oracle-xe-11.2.0-1.0.x86_64.rpm.zip missing)
endif

.deps:
	@echo Creating .deps/ dir
	mkdir .deps

provision:
	vagrant up
	vagrant ssh -c "sudo service oracle-xe stop"
	vagrant ssh -c ./free-up-disk.sh
	vagrant ssh -c "rm free-up-disk.sh"
	@echo Shutting box down
	vagrant halt

package.box:
	@echo Creating package.box
	vagrant package --base oracle-xe

