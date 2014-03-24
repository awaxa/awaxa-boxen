class people::awaxa::fonts {
  $fb = "/Users/${::boxen_user}/Library/Fonts"
  $src = "${::boxen::config::srcdir}/powerline-fonts"

  # let's get some common fonts
  repository { "${src}":
    source => 'Lokaltog/powerline-fonts',
  }

  define font_inst ( $s, $f ) {
    $font = split($name, '/')
    $f_name = $font[1]
    file { "${f}/${f_name}":
      ensure => file,
      source => "${s}/${name}",
      require => Repository[$s],
    }
  }

  $fonts = [
    'SourceCodePro/Sauce Code Powerline Black.otf',
    'SourceCodePro/Sauce Code Powerline Bold.otf',
    'SourceCodePro/Sauce Code Powerline ExtraLight.otf',
    'SourceCodePro/Sauce Code Powerline Light.otf',
    'SourceCodePro/Sauce Code Powerline Medium.otf',
    'SourceCodePro/Sauce Code Powerline Regular.otf',
    'SourceCodePro/Sauce Code Powerline Semibold.otf',
  ]

  font_inst { $fonts:
    s => $src,
    f => $fb,
  }

}
