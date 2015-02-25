# OpenDJ Base Box

This base box has OpenDJ 2.6.0 on JDK 7 on CentOS 7.

## Usage

OpendDJ is installed under `/opt/opendj` but it is not yet set up. Your
**Vagrantfile** should set up OpenDJ as part of its provisioning configuration.
An example is provided below. See [OpenDJ 2.6.0 Installation Guide][1] for more
details.

    # Vagrantfile
    Vagrant.configure(2) do |config|
      config.vm.box = "esamson/opendj"
      config.vm.box_url = "https://github.com/esamson/baseboxes/releases/download/opendj-v3/package.box"

      # Set up OpenDJ 2.6.0
      config.vm.provision "shell", inline: <<-SHELL
        sudo su -
        /opt/opendj/setup \
            --cli \
            --acceptLicense \
            --no-prompt \
            --propertiesFilePath /vagrant/opendj.properties
        firewall-cmd --permanent --zone=public --add-port=1389/tcp
        firewall-cmd --permanent --zone=public --add-port=4444/tcp
        firewall-cmd --reload
        /opt/opendj/bin/create-rc-script -f /etc/init.d/opendj
        chkconfig opendj on
      SHELL

      # LDAP port
      config.vm.network "forwarded_port", guest: 1389, host: 1389

      # Admin port
      config.vm.network "forwarded_port", guest: 4444, host: 4444
    end

In the example, we configure the firewall and port forwarding for the LDAP and
Admin ports. We also configure the service to run when the system starts.
The setup parameters are provided as a properties file.

    # opendj.properties
    hostname           =opendj.example.com
    ldapPort           =1389
    adminConnectorPort =4444
    rootUserDN         =cn=Directory Manager
    rootUserPassword   =password
    baseDN             =dc=example,dc=com
    ldifFile           =/vagrant/example.ldif

The `example.ldif` mentioned is an [LDIF][2] file that contains your initial
data to be imported into OpenDJ.

[1]: http://docs.forgerock.org/en/opendj/2.6.0/install-guide/
[2]: http://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format

