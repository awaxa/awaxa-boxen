$bootstrap = <<BOOTSTRAP
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone /vagrant /opt/boxen/repo
BOOTSTRAP

Vagrant.configure('2') do |config|
  config.vm.box = 'mavericks'
  config.vm.provider "vmware_fusion" do |v|
    v.gui = true
  end
  config.vm.provision 'shell' do |s|
    s.path = 'https://gist.githubusercontent.com/awaxa/42fb41062a9a85b69245/raw/4cfa5bb346a78e5a2fbd54c98d36ffd672a28183/softwareupdate.sh'
    s.privileged = false
  end
  config.vm.provision 'shell', inline: $bootstrap, privileged: false
end
