class people::awaxa::puppet {
  repository { "${::boxen_srcdir}/puppet": source => 'puppetlabs/puppet' }
  repository { "${::boxen_srcdir}/facter": source => 'puppetlabs/facter' }
  repository { "${::boxen_srcdir}/hiera":  source => 'puppetlabs/hiera' }
}
