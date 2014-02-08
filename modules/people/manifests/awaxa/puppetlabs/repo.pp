define people::awaxa::puppetlabs::repo () {
  include git
  $src = $::boxen::config::srcdir
  $remote = split($title, '/')
  $dirname = $remote[1]
  repository { "${src}/${dirname}":
    source => $title,
  }
  git::config::local { "${src}/${dirname}":
    key     => 'user.email',
    value   => $::people::awaxa::puppetlabs::email,
    require => Repository["${src}/${dirname}"],
  }
}
