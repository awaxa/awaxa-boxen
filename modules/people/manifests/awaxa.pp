class people::awaxa {
  include people::awaxa::base
  include people::awaxa::dotfiles
  include people::awaxa::puppet
  case $::hostname {
    'ambp': {
      include people::awaxa::applications
      include people::awaxa::preferences
      include people::awaxa::vagrant
    }
    'mini': {
      include people::awaxa::mini
    }
  }
}
