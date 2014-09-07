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
  config.vm.provision 'shell' do |s|
    s.path = 'https://gist.githubusercontent.com/awaxa/42fb41062a9a85b69245/raw/4cfa5bb346a78e5a2fbd54c98d36ffd672a28183/softwareupdate.sh'
    s.privileged = false
  end
  config.vm.synced_folder '~/boxen-vagrant', '/Users/vagrant/boxen-vagrant'
  config.vm.provision 'shell', inline: $bootstrap, privileged: false
end
