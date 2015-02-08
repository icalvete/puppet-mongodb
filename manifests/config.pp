class mongodb::config {

  if $mongodb::official {
    $final_config_file = $mongodb::params::config_file_official
  } else {
    $final_config_file = $mongodb::params::config_file
  }

  exec{ 'config_bind_ip':
    command => "/bin/sed -i -e \"s/bind_ip = .*/bind_ip = 0.0.0.0/\" $final_config_file",
    unless  => "/bin/grep 'bind_ip = 0.0.0.0' $final_config_file"
  }
}

