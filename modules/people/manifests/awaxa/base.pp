class people::awaxa::base {

  include java
  include python
  include python::virtualenvwrapper
  include zsh

  package { [
    'apg',
    'bash',
    'bats',
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
