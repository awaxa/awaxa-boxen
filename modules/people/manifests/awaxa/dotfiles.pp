class people::awaxa::dotfiles {
  repository { "${::boxen_srcdir}/dotfiles":
    ensure => present,
    source => "${::github_login}/dotfiles",
  }
  vcsrepo { "/Users/${::boxen_user}/.oh-my-zsh":
    ensure   => latest,
    provider => 'git',
    revision => 'master',
    source   => 'https://github.com/robbyrussell/oh-my-zsh.git',
  }
  people::awaxa::linked_dotfile { '.vimrc': }
  people::awaxa::linked_dotfile { '.tmux.conf': }
  people::awaxa::linked_dotfile { '.tmuxline.conf': }
  people::awaxa::linked_dotfile { '.profile': }
  people::awaxa::linked_dotfile { '.rc.d': }
  people::awaxa::linked_dotfile { '.gitconfig': }
  people::awaxa::linked_dotfile { '.inputrc': }
  people::awaxa::linked_dotfile { '.aliases': }
  people::awaxa::linked_dotfile { '.zshrc': }
  people::awaxa::linked_dotfile { '.bashrc': }
  file { "/Users/${::boxen_user}/.ssh": ensure => 'directory' }
  people::awaxa::linked_dotfile { '.ssh/config': }
  people::awaxa::linked_dotfile { '.irssi': }
  people::awaxa::linked_dotfile { '.warprc': }
  people::awaxa::linked_dotfile { 'bin': }
  people::awaxa::linked_dotfile { '.weechat': }
  people::awaxa::linked_dotfile { '.bundle': }
}
