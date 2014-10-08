class people::awaxa::nodejs {
  include nodejs::global
  nodejs::module { [
    'hubot',
    'keybase-installer',
  ]:
    node_version => $nodejs::global::version,
  }
}
