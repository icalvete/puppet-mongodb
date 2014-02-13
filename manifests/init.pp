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
  anchor {'mongodb::end':
    require => Class['mongodb::service']
  }
}
