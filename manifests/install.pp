class mongodb::install {

  package{ $mongodb::params::package:
    ensure  => present
  }
}

