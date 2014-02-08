class people::awaxa::vagrant {

  $plugins = [ 'vagrant-vmware-fusion',
               'vagrant-aws',
               'vagrant-digitalocean',
               #'oscar',
               'vagrant-windows',
               'vagrant-multiprovider-snap',
             ]

  include vagrant

  vagrant::plugin { $plugins: }

  vagrant::box { 'aws/aws':
    source  => 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box',
    require => Vagrant::Plugin['vagrant-aws'],
  }

  vagrant::box { 'digital_ocean/digital_ocean':
    source  => 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box',
    require => Vagrant::Plugin['vagrant-digitalocean'],
  }

#  vagrant::box { '':
#    source => '',
#  }

  vagrant::box { 'fedora-18-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/fedora-18-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'centos-64-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'centos-59-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-59-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'debian-607-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'debian-70rc1-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'ubuntu-server-10044-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-10044-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'ubuntu-server-12042-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box',
  }
  vagrant::box { 'sles-11sp1-x64-vbox4210-nocm/virtualbox':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/sles-11sp1-x64-vbox4210-nocm.box',
  }

  vagrant::box { 'fedora-18-x64-vf503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/fedora-18-x64-vf503-nocm.box',
  }
  vagrant::box { 'centos-64-x64-fusion503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-fusion503-nocm.box',
  }
  vagrant::box { 'debian-607-x64-vf503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vf503-nocm.box',
  }
  vagrant::box { 'debian-70rc1-x64-vf503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vf503-nocm.box',
  }
  vagrant::box { 'ubuntu-server-10044-x64-fusion503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-10044-x64-fusion503-nocm.box',
  }
  vagrant::box { 'ubuntu-svr-12042-x64-vf503-nocm/vmware_fusion':
    source => 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-svr-12042-x64-vf503-nocm.box',
  }

}
