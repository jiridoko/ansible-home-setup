# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "jiridev"
  config.vm.synced_folder "~", "/vagrant_home", mount_options: ["uid=9000", "gid=9000"]
  #config.vm.network "public_network"
  if ARGV[0] == "ssh"
    config.ssh.username = "jiri"
    config.ssh.private_key_path = "~/.ssh/id_rsa"
    config.ssh.extra_args = ["-L", "3128:10.9.0.1:3128"]
  end
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "8192"
    vb.cpus = "2"
    #vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["modifyvm", :id, "--usbxhci", "on"]
  end
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook_vagrant.yml"
    ansible.verbose = true
    ansible.vault_password_file = "/vagrant_home/.vaultp"
    if ENV['vagrant_env'] == "work"
      ansible.extra_vars = {
        hostname: "jiridev",
        yaourt_user: "vagrant",
        git_name: "Jiri Dokoupil",
        git_email: "jdokoupil@williamhill.co.uk"
      }
    else
      ansible.extra_vars = {
        hostname: "jiridev",
        yaourt_user: "vagrant",
        update_system: true
      }
    end
  end
end
