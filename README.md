# Base Boxes for Vagrant

Bunch of Makefiles for creating base boxes.

`make centos-7` will provision a new box updated with the latest system
updates. Other boxes are based on that. It should be easier to recreate an
up-to-date base box and reprovision your VM's against that rather than having
to `yum update` all your running VM's.

If you don't want to build a base box yourself, see [Releases][1] for pre-built
boxes you can use in your Vagrantfile.

    Vagrant.configure(2) do |config|
      config.vm.box = "esamson/centos-7"
      config.vm.box_url = "https://github.com/esamson/baseboxes/releases/download/centos-7-v3/package.box"
    end

Released boxes have the latest yum updates as of the **centos-7** box release
date.

[1]: https://github.com/esamson/baseboxes/releases

