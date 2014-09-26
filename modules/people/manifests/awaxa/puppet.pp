class people::awaxa::puppet {
  repository { "${::boxen_srcdir}/puppet":
    ensure => present,
    source => 'puppetlabs/puppet',
  }
  people::awaxa::binstub { 'puppet': }
  repository { "${::boxen_srcdir}/facter":
    ensure => present,
    source => 'puppetlabs/facter',
  }
  people::awaxa::binstub { 'facter': }
  repository { "${::boxen_srcdir}/hiera":
    ensure => present,
    source => 'puppetlabs/hiera',
  }
  repository { "${::boxen_srcdir}/r10k":
    ensure => present,
    source => 'adrienthebo/r10k',
  }
  people::awaxa::binstub { 'r10k': }
}
