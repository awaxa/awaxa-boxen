class people::awaxa::mini {
  include virtualbox
  class { '::vagrant': version => '1.6.5' }

  people::awaxa::linked_dotfile { '.ssh/authorized_keys': }
}
