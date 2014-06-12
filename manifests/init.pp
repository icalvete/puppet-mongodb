class mongodb () inherits mongodb::params {

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
  class {'mongodb::backup':
    require => Class['mongodb::service']
  }
  anchor {'mongodb::end':
    require => Class['mongodb::backup']
  }
}
