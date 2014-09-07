class people::awaxa::base {

  include java
  include python
  include python::virtualenvwrapper
  include zsh

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
}
