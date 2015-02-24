centos-7: centos-7/package.box
	vagrant box add --force --name esamson/centos-7 centos-7/package.box

centos-7/package.box:
	$(MAKE) -C centos-7

jdk-7: jdk-7/package.box
	vagrant box add --force --name esamson/centos-7-jdk-7 jdk-7/package.box

jdk-7/package.box: centos-7
	$(MAKE) -C jdk-7

jdk-8: jdk-8/package.box
	vagrant box add --force --name esamson/centos-7-jdk-8 jdk-8/package.box

jdk-8/package.box: centos-7
	$(MAKE) -C jdk-8

opendj-2.6.0: opendj-2.6.0/package.box
	vagrant box add --force --name esamson/opendj-2.6.0 opendj-2.6.0/package.box

opendj-2.6.0/package.box: jdk-7
	$(MAKE) -C opendj-2.6.0

clean:
	$(MAKE) -C opendj-2.6.0 clean
	$(MAKE) -C jdk-8 clean
	$(MAKE) -C jdk-7 clean
	$(MAKE) -C centos-7 clean

.PHONY: centos-7 jdk-7 jdk-8 opendj-2.6.0 clean
