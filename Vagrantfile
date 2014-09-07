$bootstrap = <<BOOTSTRAP
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone /vagrant /opt/boxen/repo
mkdir -p /Users/vagrant/Library/Keychains
cp -v /Users/vagrant/boxen-vagrant/login.keychain /Users/vagrant/Library/Keychains/login.keychain
security unlock-keychain -p vagrant
/opt/boxen/repo/script/boxen --no-fde
BOOTSTRAP

Vagrant.configure('2') do |config|
  config.vm.box = 'mavericks'
  config.vm.synced_folder '~/boxen-vagrant', '/Users/vagrant/boxen-vagrant'
  config.vm.provision 'shell', inline: $bootstrap, privileged: false
end
