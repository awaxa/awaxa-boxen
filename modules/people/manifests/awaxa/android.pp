class people::awaxa::android {

  include android::platform_tools

  package { 'repo':
    ensure => latest,
  }

  package { 'Android Studio':
    ensure   => present,
    provider => 'compressed_app',
    source   => 'http://dl.google.com/dl/android/studio/ide-zips/0.8.11/android-studio-ide-135.1446794-mac.zip',
  }

}
