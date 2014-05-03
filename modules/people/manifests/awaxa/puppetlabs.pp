class people::awaxa::puppetlabs {

  $email = 'greg.kitson@puppetlabs.com'


  include hipchat

  $src = $::boxen::config::srcdir

  people::awaxa::puppetlabs::repo { 'puppetlabs/puppet': }

  people::awaxa::puppetlabs::repo { 'puppetlabs/facter': }

  include people::awaxa::puppetlabs::courseware

  people::awaxa::puppetlabs::repo { 'puppetlabs/seteam-vagrant-stack': }

  include people::awaxa::puppetlabs::trainingbootstrap

  people::awaxa::globalgem { 'puppet-lint': }

  people::awaxa::puppetlabs::repo { 'puppetlabs/puppetlabs-postgresql': }

}
