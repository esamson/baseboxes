all: clean provision package.box
	@echo base box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

provision:
	vagrant up
	vagrant halt
	vagrant up
	vagrant ssh -c /vagrant/free-up-disk.sh
	vagrant halt

package.box:
	vagrant package --base centos-7

