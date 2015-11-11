.PRECIOUS: .deps/jdk-7.tar.gz

all: clean deps provision package.box
	@echo jdk-7 box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/jdk-7.tar.gz
	@echo Dependencies are in .deps/

clean-deps:
	rm -rf .deps

.deps/jdk-7.tar.gz: .deps
ifeq ("$(wildcard .deps/jdk-7.tar.gz)", "")
	$(info Downloading JDK 7)
	wget -O .deps/jdk-7.tar.gz --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.tar.gz
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
	vagrant package --base jdk-7

