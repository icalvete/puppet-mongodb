class mongodb::service {

  service { $mongodb::params::service:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

