class people::awaxa::base {

  include java
  include python
  include redis
  include zsh

  package { [
    'apg',
    'awscli',
    'bash',
    'bats',
    'bazaar',
    'coreutils',
    'dash',
    'dos2unix',
    'ffmpeg',
    'gawk',
    'gist',
    'gnupg',
    'graphviz',
    'htop-osx',
    'irssi',
    'mercurial',
    'ngircd',
    'nmap',
    'peco',
    'pstree',
    'python3',
    'rdesktop',
    'reattach-to-user-namespace',
    'rtorrent',
    'sickbeard',
    'tmux',
    'tree',
    'vim',
    'watch',
    'wget',
  ]:
    ensure => latest,
  }

  homebrew::tap { 'homebrew/binary':
    ensure => present,
  }

  homebrew::tap { 'nviennot/tmate':
    ensure => present,
  }
  package { 'tmate':
    ensure  => latest,
    require => Homebrew::Tap['nviennot/tmate'],
  }

  homebrew::tap { 'jlhonora/lsusb':
    ensure => present,
  }
  package { 'lsusb':
    ensure  => latest,
    require => Homebrew::Tap['jlhonora/lsusb'],
  }

  package { 'aspell':
    ensure          => latest,
    install_options => [
      '--with--lang-en',
    ],
  }

  package { 'weechat':
    ensure          => latest,
    install_options => [
      '--with-aspell',
      '--with-python',
      '--with-ruby',
    ],
    require => Package['aspell'],
  }

  file { [
    '/usr/local',
    '/usr/local/bin',
  ]:
    ensure => directory,
    mode   => '0755',
    owner  => $::boxen_user,
    group  => 'admin',
  }

  file { '/usr/local/bin/mute':
    ensure => file,
    mode   => '0755',
    owner  => '0',
    group  => '0',
    source => 'puppet:///modules/people/mute',
  }

  file { "${boxen::config::srcdir}/awaxa-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  sudoers { $::boxen_user:
    ensure   => present,
    type     => 'user_spec',
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => '(ALL) NOPASSWD : ALL',
  }
}
