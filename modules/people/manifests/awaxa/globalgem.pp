define people::awaxa::globalgem () {
  ruby::gem { $title:
    gem  => $title,
    ruby => $::people::awaxa::globalruby,
  }
}
