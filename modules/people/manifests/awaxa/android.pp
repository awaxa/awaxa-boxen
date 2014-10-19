class people::awaxa::android {

  include android::platform_tools

  package { 'repo':
    ensure => latest,
  }

  package { 'Java 6':
    ensure   => present,
    provider => 'pkgdmg',
    source   => 'http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2014-001.dmg',
  }

  package { 'Android Studio':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'http://dl.google.com/dl/android/studio/ide-zips/0.8.11/android-studio-ide-135.1446794-mac.zip',
  }

}
