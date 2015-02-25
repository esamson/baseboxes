centos-7: centos-7/package.box
	vagrant box add --force --name esamson/centos-7 centos-7/package.box

centos-7/package.box:
	$(MAKE) -C centos-7

jdk-7: jdk-7/package.box
	vagrant box add --force --name esamson/jdk-7 jdk-7/package.box

jdk-7/package.box: centos-7
	$(MAKE) -C jdk-7

jdk-8: jdk-8/package.box
	vagrant box add --force --name esamson/jdk-8 jdk-8/package.box

jdk-8/package.box: centos-7
	$(MAKE) -C jdk-8

opendj: opendj/package.box
	vagrant box add --force --name esamson/opendj opendj/package.box

opendj/package.box: jdk-7
	$(MAKE) -C opendj

clean:
	$(MAKE) -C opendj clean
	$(MAKE) -C jdk-8 clean
	$(MAKE) -C jdk-7 clean
	$(MAKE) -C centos-7 clean

.PHONY: centos-7 jdk-7 jdk-8 opendj clean
