class mongodb::params {

  $backup           = true
  $backup_dir       = hiera('backup_dir')
  $backup_directory = "${$backup_dir}/mongo"
  $backup_retention = 7
  $small_files      = true

  $official          = true

  case $::operatingsystem {

    /^(Debian|Ubuntu)$/: {

      $package_official     = 'mongodb-org'
      $package              = 'mongodb'
      $service_official     = 'mongod'
      $service              = 'mongodb'
      $config_file_official = '/etc/mongod.conf'
      $config_file          = '/etc/mongodb.conf'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}

