class mongodb::config {

  exec{ 'config_bind_ip':
    command => "/bin/sed -i -e \"s/bind_ip = .*/bind_ip = 0.0.0.0/\" ${mongodb::params::config_file}",
    unless  => "/bin/grep 'bind_ip = 0.0.0.0' ${mongodb::params::config_file}"
  }
}

