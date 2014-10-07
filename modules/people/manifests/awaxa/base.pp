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

  file { [
    '/usr/local',
    '/usr/local/bin',
  ]:
    ensure => directory,
    mode   => '0755',
    owner  => $::boxen_user,
    group  => 'admin',
  }
}
