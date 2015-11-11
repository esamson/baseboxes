.PRECIOUS: .deps/hbase.tar.gz .deps/maven.tar.gz .deps/hadoop-src.tar.gz .deps/kafka.tgz

all: clean deps provision package.box
	@echo sl-tools box built

clean:
	rm -f *.box
	vagrant destroy -f
	rm -rf .vagrant/

deps: .deps/hbase.tar.gz .deps/maven.tar.gz .deps/hadoop-src.tar.gz .deps/kafka.tgz
	@echo Dependencies are in .deps/

clean-deps:
	rm -rf .deps

.deps/hbase.tar.gz: .deps
ifeq ("$(wildcard .deps/hbase.tar.gz)", "")
	$(info Downloading HBase)
	curl -o .deps/hbase.tar.gz `../scripts/apache-mirror hbase/0.98.16/hbase-0.98.16-hadoop2-bin.tar.gz`
endif

.deps/maven.tar.gz: .deps
ifeq ("$(wildcard .deps/maven.tar.gz)", "")
	$(info Downloading Maven)
	curl -o .deps/maven.tar.gz `../scripts/apache-mirror maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz`
endif

.deps/hadoop-src.tar.gz: .deps
ifeq ("$(wildcard .deps/hadoop-src.tar.gz)", "")
	$(info Downloading Hadoop sources)
	curl -o .deps/hadoop-src.tar.gz `../scripts/apache-mirror hadoop/common/hadoop-2.6.0/hadoop-2.6.0-src.tar.gz`
endif

.deps/kafka.tgz: .deps
ifeq ("$(wildcard .deps/kafka.tgz)", "")
	$(info Downloading Kafka)
	curl -o .deps/kafka.tgz `../scripts/apache-mirror kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz`
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
	vagrant package --base sl-tools

