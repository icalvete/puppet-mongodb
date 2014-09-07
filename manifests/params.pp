class mongodb::params {

  $backup           = true
  $backup_dir       = hiera('backup_dir')
  $backup_directory = "${$backup_dir}/mongo"
  $backup_retention = 7
  $small_files      = true

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

