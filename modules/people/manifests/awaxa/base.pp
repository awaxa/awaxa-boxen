class people::awaxa::base {

  include java
  include python
  include zsh

  package { [
    'apg',
    'awscli',
    'bash',
    'bats',
    'bazaar',
    'dash',
    'dos2unix',
    'gist',
    'gnupg',
    'htop-osx',
    'irssi',
    'mercurial',
    'nmap',
    'pstree',
    'python3',
    'rdesktop',
    'reattach-to-user-namespace',
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

  homebrew::tap { 'peco/peco':
    ensure => present,
  }
  package { 'peco':
    ensure  => latest,
    require => Homebrew::Tap['peco/peco'],
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
