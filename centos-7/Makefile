all: clean provision package.box
	@echo centos-7 box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

provision:
	vagrant up
	vagrant halt
	vagrant up
	vagrant ssh -c ./free-up-disk.sh
	vagrant ssh -c "rm free-up-disk.sh"
	vagrant halt

package.box:
	vagrant package --base centos-7

