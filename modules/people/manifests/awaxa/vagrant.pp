class people::awaxa::vagrant {
  class { 'virtualbox':
    version     => '4.3.18',
    patch_level => '96516',
  }
  include vmware_fusion
  class { '::vagrant': version => '1.6.5' }

  people::awaxa::linked_dotfile { '.vagrant.d/Vagrantfile': }

  #vagrant::plugin { 'vagrant-vmware-fusion': }
  vagrant::plugin { 'vagrant-multiprovider-snap': }
  vagrant::plugin { 'vagrant-cachier': }
  #vagrant::plugin { 'oscar': }
  vagrant::plugin { 'vagrant-hosts': }
  vagrant::plugin { 'vagrant-pe_build': }
  vagrant::plugin { 'vagrant-auto_network': }
  vagrant::plugin { 'vagrant-config_builder': }

  vagrant::plugin { 'vagrant-digitalocean': }
  vagrant::box { 'digital_ocean/digital_ocean':
    source  => 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box',
    require => Vagrant::Plugin['vagrant-digitalocean'],
  }

  package { 'packer':
    ensure  => latest,
    require => Homebrew::Tap['homebrew/binary'],
  }
}
