all: centos-7 jdk-7 jdk-8 oracle-xe opendj hsqldb

centos-7: centos-7/.vagrant/add

centos-7/.vagrant/add: centos-7/package.box
	vagrant box add --force --name esamson/centos-7 centos-7/package.box
	touch centos-7/.vagrant/add

centos-7/package.box:
	$(MAKE) -C centos-7

jdk-7: jdk-7/.vagrant/add

jdk-7/.vagrant/add: jdk-7/package.box
	vagrant box add --force --name esamson/jdk-7 jdk-7/package.box
	touch jdk-7/.vagrant/add

jdk-7/package.box: centos-7/.vagrant/add
	$(MAKE) -C jdk-7

sl-tools: sl-tools/package.box
	vagrant box add --force --name esamson/sl-tools sl-tools/package.box

sl-tools/package.box: jdk-7/.vagrant/add
	$(MAKE) -C sl-tools

jdk-8: jdk-8/package.box
	vagrant box add --force --name esamson/jdk-8 jdk-8/package.box

jdk-8/package.box: centos-7
	$(MAKE) -C jdk-8

opendj: opendj/package.box
	vagrant box add --force --name esamson/opendj opendj/package.box

opendj/package.box: jdk-7
	$(MAKE) -C opendj

hsqldb: hsqldb/package.box
	vagrant box add --force --name esamson/hsqldb hsqldb/package.box

hsqldb/package.box: jdk-8
	$(MAKE) -C hsqldb

oracle-xe: oracle-xe/package.box
	vagrant box add --force --name esamson/oracle-xe oracle-xe/package.box

oracle-xe/package.box: centos-7
	$(MAKE) -C oracle-xe

clean:
	$(MAKE) -C sl-tools clean
	$(MAKE) -C hsqldb clean
	$(MAKE) -C opendj clean
	$(MAKE) -C oracle-xe clean
	$(MAKE) -C jdk-8 clean
	$(MAKE) -C jdk-7 clean
	$(MAKE) -C centos-7 clean

.PHONY: centos-7 jdk-7 jdk-8 oracle-xe opendj hsqldb sl-tools clean
