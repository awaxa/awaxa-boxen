class people::awaxa::puppet {
  repository { "${boxen::config::srcdir}/puppet": source => 'puppetlabs/puppet' }
  repository { "${boxen::config::srcdir}/facter": source => 'puppetlabs/facter' }
  repository { "${boxen::config::srcdir}/hiera":  source => 'puppetlabs/hiera' }
}
