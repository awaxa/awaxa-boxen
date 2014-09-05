class people::awaxa::dotfiles {
  repository { "${::boxen_srcdir}/dotfiles":
    ensure => present,
    source => "${::boxen_user}/dotfiles",
  }
  repository { "/Users/${::boxen_user}/.oh-my-zsh":
    ensure => 'master',
    source => 'robbyrussell/oh-my-zsh',
  }
  people::awaxa::linked_dotfile { '.vimrc': }
  file { [ "/Users/${::boxen_user}/.vim",
           "/Users/${::boxen_user}/.vim/bundle", ]:
    ensure => directory,
  }
  repository { "/Users/${::boxen_user}/.vim/bundle/Vundle.vim":
    ensure  => 'master',
    source  => 'gmarik/Vundle.vim',
    require => File["/Users/${::boxen_user}/.vim/bundle"],
  }
  people::awaxa::linked_dotfile { '.tmux.conf': }
  people::awaxa::linked_dotfile { '.profile': }
  people::awaxa::linked_dotfile { '.rc.d': }
  people::awaxa::linked_dotfile { '.gitconfig': }
  people::awaxa::linked_dotfile { '.inputrc': }
  people::awaxa::linked_dotfile { '.aliases': }
  people::awaxa::linked_dotfile { '.zshrc': }
  people::awaxa::linked_dotfile { '.bashrc': }
  people::awaxa::linked_dotfile { '.bash_aliases': }
  file { "/Users/${::boxen_user}/.ssh": ensure => 'directory' }
  people::awaxa::linked_dotfile { '.ssh/config': }
  people::awaxa::linked_dotfile { '.vagrant.d/Vagrantfile': }
  people::awaxa::linked_dotfile { '.irssi': }
}
