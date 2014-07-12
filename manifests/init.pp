class mongodb (

  $backup           = $mongodb::params::backup,
  $backup_retention = $mongodb::params::backup_retention

) inherits mongodb::params {

  anchor {'mongodb::begin':
    before => Class['mongodb::install']
  }
  class {'mongodb::install':
    require => Anchor['mongodb::begin']
  }
  class {'mongodb::config':
    require => Class['mongodb::install']
  }
  class {'mongodb::service':
    subscribe => Class['mongodb::config']
  }

  if $backup {
    class {'mongodb::backup':
      require => Class['mongodb::service']
    }
  }

  anchor {'mongodb::end':
    require => Class['mongodb::service']
  }
}
