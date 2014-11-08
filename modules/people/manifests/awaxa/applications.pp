class people::awaxa::applications {

  include brewcask

  package { [
    'dropbox',
    'gimp',
    'google-chrome',
    'google-hangouts',
    'hipchat',
    'mailbox',
    'nimbus',
    'onepassword',
    'sizeup',
    'spotify',
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

}
