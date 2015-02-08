class mongodb::service {

  if $mongodb::official {
    $final_service = $mongodb::params::service_official
  } else {
    $final_service = $mongodb::params::service
  }

  service { $final_service:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

