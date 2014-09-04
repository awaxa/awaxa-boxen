class people::awaxa::preferences {

  include osx::global::disable_remote_control_ir_receiver
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
  include osx::finder::show_hidden_files
  class { 'osx::sound::interface_sound_effects': enable => false }
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update
  include osx::keyboard::capslock_to_control

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

  file { "/Users/${::boxen_user}/Screenshots":
    ensure => directory,
  }
  boxen::osx_defaults { 'Set Screenshot Directory':
    ensure => present,
    user    => $::boxen_user,
    key     => 'location',
    domain  => 'com.apple.screencapture',
    value   => "/Users/${::boxen_user}/Screenshots",
    require => File["/Users/${::boxen_user}/Screenshots"],
  }

}
