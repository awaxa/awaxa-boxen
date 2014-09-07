class people::awaxa::applications {

  include chrome
  include foreman
  include googledrive
  include heroku
  include hipchat
  include iterm2::colors::arthur
  include iterm2::colors::solarized_dark
  include iterm2::colors::solarized_light
  include iterm2::stable
  include java
  include nimbus
  include onepassword
  include prince
  include python
  include python::virtualenvwrapper
  include sizeup
  include tunnelblick::beta
  include vlc
  include zsh

  class { 'powerline':
    manage_font_library_dir => true,
  }

  package { [
    'apg',
    'bash',
    'bazaar',
    'dash',
    'dos2unix',
    'gist',
    'htop-osx',
    'pstree',
    'reattach-to-user-namespace',
    'tmux',
    'tree',
    'vim',
    'watch',
    ]:
    ensure => latest,
  }

  package { [
    'awscli',
    'irssi',
    'mercurial',
    'nmap',
    'python3',
    'rdesktop',
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

  package { 'GoogleVoiceAndVideoSetup':
    ensure   => present,
    source   => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
    provider => 'pkgdmg',
  }
}
