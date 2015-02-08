class mongodb::install {

  if $mongodb::official {
    
    $final_package = $mongodb::params::package_official

    exec { 'adding_mongodb_key':
      command => '/usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10',
      user    => 'root',
      before  => Exec['adding_official_repo']
    }

    exec { 'adding_official_repo':
      command  => "/bin/echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | /usr/bin/tee /etc/apt/sources.list.d/mongodb.list",
      user     => 'root',
      provider => 'shell',
      notify   => Exec['mongodb_apt-get_update'],
      unless   => '/usr/bin/test -f /etc/apt/sources.list.d/mongodb.list',
      before   => Exec['mongodb_apt-get_update']
    }

    exec { 'mongodb_apt-get_update':
      command     => '/usr/bin/apt-get update',
      user        => 'root',
      refreshonly => true,
      before      => Package[$final_package]
    }
  } else {
  
    $final_package = $mongodb::params::package
  }

  package{ $final_package:
    ensure  => present
  }
}

