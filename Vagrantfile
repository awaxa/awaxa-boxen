$bootstrap = <<BOOTSTRAP
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
[ -f /opt/boxen/repo/.git/config ] || git clone /vagrant /opt/boxen/repo 2>&1
[ -f $HOME/Library/Keychains/login.keychain ] || security create-keychain -p vagrant login.keychain
security unlock-keychain -p vagrant
cd /opt/boxen/repo
script/bootstrap --deployment --local --without development:test --no-cache
.bundle/ruby/*/gems/boxen-*/script/Boxen GitHub\\ Password\\ vagrant ''
.bundle/ruby/*/gems/boxen-*/script/Boxen GitHub\\ API\\ Token vagrant #{ENV['GITHUB_API_TOKEN']}
script/boxen --no-fde
BOOTSTRAP

Vagrant.configure('2') do |config|
  config.vm.define 'mavericks' do |mavericks|
    mavericks.vm.box = 'mavericks'
  end
  config.vm.define 'mountainlion', autostart: false do |mountainlion|
    mountainlion.vm.box = 'mountainlion'
  end
  config.vm.provision 'shell', inline: $bootstrap, privileged: false
end
