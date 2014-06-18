class mongodb::params {

  $backup_dir  = hiera('backup_dir')
  $small_files = true

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

