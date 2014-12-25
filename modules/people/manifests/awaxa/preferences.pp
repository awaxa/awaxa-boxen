class people::awaxa::preferences {

  $phone = base64(decode,'KzE3MDMyMTc1MTc4')
  $email = 'greg.kitson@gmail.com'
  $personal = [ ]
  unless $::sp_serial_number in $personal {
    $_more = ",\n or +18775759775/help@puppetlabs.com"
  }
  osx::recovery_message { "If found, please contact ${phone}/${email}${_more}": }

  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  class { 'osx::global::key_repeat_rate': rate => 2 }
  class { 'osx::global::key_repeat_delay': delay => 15 }
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::disable
  include osx::dock::disable_dashboard
  include osx::dock::icon_size
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::unhide_library
  class { 'osx::sound::interface_sound_effects': enable => false }
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update
  include osx::keyboard::capslock_to_control
  include osx::universal_access::ctrl_mod_zoom
  include osx::safari::enable_developer_mode

  class { 'osx::dock::hot_corners':
    bottom_right => 'Start Screen Saver',
    bottom_left  => 'Start Screen Saver',
  }

  boxen::osx_defaults { 'Set Screenshot Directory':
    ensure => present,
    user   => $::boxen_user,
    key    => 'location',
    domain => 'com.apple.screencapture',
    value  => "/Users/${::boxen_user}/Dropbox/Screenshots",
  }

  boxen::osx_defaults { 'Set Mute Volume LogoutHook':
    ensure => present,
    user   => 'root',
    key    => 'LogoutHook',
    domain => 'com.apple.loginwindow',
    value  => '/usr/local/bin/mute',
  }
}
