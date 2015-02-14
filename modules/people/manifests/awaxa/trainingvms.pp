class people::awaxa::trainingvms {
  include nginx
  $port = '9091'
  $docroot = "/Users/${::boxen_user}/Public/trainingvms"
  file { "${nginx::config::sitesdir}/trainingvms.conf":
    ensure  => file,
    content => template('people/trainingvms.conf.erb'),
    notify  => Service['dev.nginx'],
  }
}
