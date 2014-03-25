class people::awaxa::nginx {

  package { 'nginx':
    ensure => latest,
  }

  file { '/opt/boxen/homebrew/etc/nginx/nginx.conf':
    ensure  => file,
    content => template('people/nginx.conf.erb'),
  }

}
