all: clean provision box
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

box:
	vagrant package --base centos-7

