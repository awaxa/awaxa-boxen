class people::awaxa::puppetlabs {

  $email = 'greg.kitson@puppetlabs.com'


  include hipchat

  $src = $::boxen::config::srcdir

  people::awaxa::puppetlabs::repo { 'puppetlabs/puppet': }

  people::awaxa::puppetlabs::repo { 'puppetlabs/facter': }

  file { '/usr/local/bin/envpuppet':
    ensure  => link,
    target  => "${src}/puppet/ext/envpuppet",
    require => [ Repository["${src}/puppet"], File['/usr/local/bin'] ],
  }

  include people::awaxa::puppetlabs::courseware

  people::awaxa::puppetlabs::repo { 'puppetlabs/seteam-vagrant-stack': }

  include people::awaxa::puppetlabs::trainingbootstrap

  people::awaxa::globalgem { 'puppet-lint': }

  people::awaxa::puppetlabs::repo { 'puppetlabs/puppetlabs-postgresql': }

}
