class mongodb::params {

  case $::operatingsystem {

    /^(Debian|Ubuntu)$/: {
      $package     = 'mongodb'
      $service     = 'mongodb'
      $config_file = '/etc/mongodb.conf'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}

