Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
      # Don't produce ubuntu-xenial-16.04-cloudimg-console.log:
      vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]

      # Display the VirtualBox GUI when booting the machine
      vb.gui = true

      # Customize the amount of memory on the VM:
      vb.memory = "2048"

      # Customize the number of cpus on the VM:
      vb.cpus = "1"

      # Using virtio network driver may speed up networking:
      # vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end


  config.ssh.forward_x11 = true

  # Forward Jupyter port:
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  config.vm.provision "file", source: "files/home/user/.inputrc", destination: ".inputrc"

  config.vm.provision "shell", path: "provisioning/vm-prep.sh"
  config.vm.provision "shell", path: "provisioning/vm-apt-setup.sh"
  config.vm.provision "shell", path: "provisioning/vm-pkg-inst.sh"
  config.vm.provision "shell", path: "provisioning/vm-singularity-inst.sh"

  config.vm.provision :shell, privileged: false, path: "provisioning/vm-user-prep.sh"

  config.vm.provision "shell", path: "provisioning/vm-clean.sh"
end
