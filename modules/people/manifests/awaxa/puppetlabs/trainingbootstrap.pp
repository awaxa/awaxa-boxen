class people::awaxa::puppetlabs::trainingbootstrap {

  people::awaxa::puppetlabs::repo { 'puppetlabs/puppetlabs-training-bootstrap': }

  # manually installed https://communities.vmware.com/community/vmtn/automationtools/ovf
  include virtualbox
  include vagrant

  file { "/Users/${::boxen_user}/Sites":
    ensure => directory,
  }

  package { 'xorriso':
    ensure => latest,
  }

  people::awaxa::globalgem { [ 'gpgme', 'nokogiri', ]: }

}
