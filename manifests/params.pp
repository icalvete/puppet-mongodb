class mongodb::params {

  $backup           = true
  $backup_dir       = hiera('backup_dir')
  $small_files      = true
  $backup_retention = 7

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

