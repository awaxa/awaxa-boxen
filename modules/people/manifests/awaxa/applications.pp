class people::awaxa::applications {

  include caffeine
  include chrome
  include dropbox
  #include gpgtools
  include iterm2::dev
  #include iterm2::colors::solarized_light
  #include iterm2::colors::solarized_dark
  include onepassword
  include java
  include python
  include rdio
  include sizeup
  include skype
  include tunnelblick::beta
  include people::awaxa::vagrant
  include vim
  include virtualbox
  include vlc
  include vmware_fusion
  include zsh

  package { [
    'htop-osx',
    'watch',
    'wget',
    'tree',
    'pstree',
    'apg',
    'tmux',
    'mutt',
    ]:
      ensure => latest,
  }

  homebrew::tap { 'homebrew/binary': }

  package { 'packer':
    ensure  => latest,
    require => Homebrew::Tap['homebrew/binary'],
  }

  people::awaxa::globalgem { 'gist': }

  python::pip { 'awscli':
    virtualenv => $python::config::global_venv,
  }

  package {
    'GoogleVoiceAndVideoSetup':
      source   => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
      provider => pkgdmg,
  }
}
