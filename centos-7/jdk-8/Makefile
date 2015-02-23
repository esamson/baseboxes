all: clean deps provision package.box
	@echo jdk-8 box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/jdk-8.tar.gz
	@echo Dependencies are in .deps/

clean-deps:
	rm -rf .deps

.deps/jdk-8.tar.gz: .deps
	wget -O .deps/jdk-8.tar.gz --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.tar.gz

.deps:
	@echo Creating .deps/ dir
	mkdir .deps

provision:
	vagrant up
	vagrant ssh -c ./free-up-disk.sh
	vagrant ssh -c "rm free-up-disk.sh"
	vagrant halt

package.box:
	vagrant package --base centos-7-jdk-8

