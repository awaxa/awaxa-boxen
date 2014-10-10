class people::awaxa::preferences {

  include osx::global::disable_key_press_and_hold
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  class { 'osx::global::key_repeat_rate': rate => 2 }
  class { 'osx::global::key_repeat_delay': delay => 15 }
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  include osx::dock::disable
  include osx::dock::hide_indicator_lights
  include osx::dock::icon_size
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::unhide_library
  class { 'osx::sound::interface_sound_effects': enable => false }
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update
  include osx::keyboard::capslock_to_control
  include osx::universal_access::ctrl_mod_zoom


  class { 'osx::dock::hot_corners':
    bottom_right => 'Start Screen Saver',
    bottom_left  => 'Start Screen Saver',
  }

  boxen::osx_defaults { 'Disable Dashboard':
    ensure => present,
    user   => $::boxen_user,
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => '1',
  }

  boxen::osx_defaults { 'Set Screenshot Directory':
    ensure => present,
    user   => $::boxen_user,
    key    => 'location',
    domain => 'com.apple.screencapture',
    value  => "/Users/${::boxen_user}/Dropbox/Screenshots",
  }

}
