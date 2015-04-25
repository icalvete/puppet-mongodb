define mongodb::load_script (

  $script = undef,
  $unless = undef

) {

  include mongodb

  if $mongodb::official {
    $final_service = $mongodb::params::service_official
  } else {
    $final_service = $mongodb::params::service
  }

  $script_source = $script['source']
  $script_file   = $script['file']

  notice($script['source'])

  if ! $script {

    fail('mongodb::load_script needs script parameter.')
  }else{

    if ! is_hash($script) {
      fail('mongodb::load_script script parameter needs to be an hash.')
    }
  }

  if $script_file =~ /\.erb$/ {

    file {"load_script_${name}":
      path    => "/tmp/${script_file}",
      content => template("${script_source}/${script_file}"),
    }
  }else{

    file {"load_script_${name}":
      path   => "/tmp/${script_file}",
      source => "puppet:///modules/${script_source}/${script_file}",
    }
  }

  exec {"load_scriptscript_${name}":
    cwd     => '/tmp/',
    command => "/usr/bin/mongo /tmp/${script_file}",
    require => [File["load_script_${name}"], Service[$final_service]],
    unless  => $unless
  }
}
