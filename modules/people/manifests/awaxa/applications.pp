class people::awaxa::applications {

  include brewcask
  Package <| title == 'brew-cask' |> {
    ensure => latest,
  }

  package { [
    'dropbox',
    'evernote',
    'gimp',
    'gitter',
    'google-chrome',
    'google-hangouts',
    'gopro-studio',
    'hipchat',
    'mailbox',
    'nimbus',
    'onepassword',
    'sabnzbd',
    'sizeup',
    'spotify',
    'transmission',
    'tunnelblick',
    'vlc',
  ]:
    ensure   => present,
    provider => 'brewcask',
  }

  include foreman
  include heroku
  include iterm2::colors::arthur
  include iterm2::colors::saturn
  include iterm2::colors::solarized_dark
  include iterm2::colors::solarized_light
  include iterm2::colors::zenburn
  include iterm2::stable
  include prince

  class { 'powerline':
    manage_font_library_dir => true,
  }

  repository { "${::boxen_srcdir}/tugboat":
    ensure => present,
    source => 'pearkes/tugboat',
  }
  people::awaxa::binstub { 'tugboat': }

}
