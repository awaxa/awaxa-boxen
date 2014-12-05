class people::awaxa::nodejs {
  nodejs::module { [
    'hubot',
    'keybase-installer',
  ]:
    node_version => 'v0.10',
  }
}
