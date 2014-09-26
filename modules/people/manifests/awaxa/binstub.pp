define people::awaxa::binstub (
  $gemfile = "${boxen_srcdir}/${title}/Gemfile",
) {
  file { "/usr/local/bin/${title}":
    ensure  => file,
    mode    => '0755',
    content => template('people/binstub.erb'),
  }
}
