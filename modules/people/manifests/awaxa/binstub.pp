define people::awaxa::binstub (
  $gemfile = "${boxen_srcdir}/${title}/Gemfile",
) {
  file { "/usr/local/bin/${title}":
    ensure  => file,
    owner   => $::boxen_user,
    group   => 'admin',
    mode    => '0755',
    content => template('people/binstub.erb'),
  }
}
