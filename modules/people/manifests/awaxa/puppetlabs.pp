class people::awaxa::puppetlabs {

  include hipchat
  include git

  $src = "${boxen::config::srcdir}"
  $globalruby = $people::awaxa::globalruby

  define pl_repo () {
    $src = "${boxen::config::srcdir}"
    $email = 'greg.kitson@puppetlabs.com'
    $remote = split("$title", '/')
    $dirname = $remote[1]
    repository { "${src}/${dirname}":
      source => "$title",
    }
    git::config::local { "${src}/${dirname}":
      key     => 'user.email',
      value   => "$email",
      require => Repository["${src}/${dirname}"],
    }
  }


  pl_repo { 'puppetlabs/puppet': }

  pl_repo { 'puppetlabs/facter': }

  file { '/usr/local/bin/envpuppet':
    ensure  => link,
    target  => "$src/puppet/ext/envpuppet",
    require => [ Repository["$src/puppet"], File['/usr/local/bin'] ],
  }


  pl_repo { 'awaxa/courseware-fundamentals': }

  ruby::gem { "showoff for $globalruby":
    gem     => 'showoff',
    ruby    => "$globalruby",
    version => '>= 0.9.7',
  }

  include imagemagick
  ruby::gem { "rmagick for $globalruby":
    gem     => 'rmagick',
    ruby    => "$globalruby",
    require => Package['boxen/brews/imagemagick'],
  }

  ruby::gem { "pdfkit for $globalruby":
    gem     => 'pdfkit',
    ruby    => "$globalruby",
  }


  pl_repo { 'puppetlabs/seteam-vagrant-stack': }


  pl_repo { 'puppetlabs/puppetlabs-training-bootstrap': }

  # manually installed https://communities.vmware.com/community/vmtn/automationtools/ovf
  include virtualbox
  include vagrant

  file { "/Users/${::boxen_user}/Sites":
    ensure => directory,
  }

  package { 'xorriso':
    ensure => latest,
  }

  ruby::gem { "gpgme for $globalruby":
    gem  => 'gpgme',
    ruby => "$globalruby",
  }

  ruby::gem { "nokogiri for $globalruby":
    gem  => 'nokogiri',
    ruby => "$globalruby",
  }


  ruby::gem { 'puppet-lint':
    gem  => 'puppet-lint',
    ruby => "$globalruby",
  }

}
