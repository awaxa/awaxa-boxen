class people::awaxa::applications {

  include chrome
  include dropbox
  include foreman
  include heroku
  include hipchat
  include iterm2::colors::arthur
  include iterm2::colors::solarized_dark
  include iterm2::colors::solarized_light
  include iterm2::stable
  include java
  include nimbus
  include onepassword
  include powerline
  include prince
  include python
  include python::virtualenvwrapper
  include sizeup
  include tunnelblick::beta
  include vlc
  include zsh

  package { [
    'apg',
    'bash',
    'dash',
    'dos2unix',
    'gist',
    'htop-osx',
    'irssi',
    'pstree',
    'tmux',
    'tree',
    'vim',
    'watch',
    ]:
      ensure => latest,
  }

  package { [
    'python3',
    'wget',
    ]:
    ensure => present,
  }

  homebrew::tap { 'homebrew/binary':
    ensure => present,
  }
  package { 'packer':
    ensure  => latest,
    require => Homebrew::Tap['homebrew/binary'],
  }

  python::mkvirtualenv { 'aws':
    ensure => present,
    before => Python::Pip[ 'awscli' ],
  }
  python::pip { 'awscli':
    ensure     => present,
    virtualenv => "${::python::config::venv_home}/aws",
  }

  class { 'nodejs::global': version => 'v0.10' }

  package { 'GoogleVoiceAndVideoSetup':
    ensure   => present,
    source   => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
    provider => 'pkgdmg',
  }
}
