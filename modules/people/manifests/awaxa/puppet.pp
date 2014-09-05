class people::awaxa::puppet {
  repository { "${::boxen_srcdir}/puppet":
    ensure => present,
    source => 'puppetlabs/puppet',
  }
  repository { "${::boxen_srcdir}/facter":
    ensure => present,
    source => 'puppetlabs/facter',
  }
  repository { "${::boxen_srcdir}/hiera":
    ensure => present,
    source => 'puppetlabs/hiera',
  }
}
