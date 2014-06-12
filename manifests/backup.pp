class mongodb::backup {

  $backup_dir = $mongodb::params::backup_dir


  file{ 'mongo_backup_dir':
    ensure => directory,
    path   => "${backup_dir}/mongo",
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file {'mongo_backup_script':
    ensure  => present,
    path    => '/root/mongo_backup.sh',
    content => template("${module_name}/mongo_backup.sh.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
  }

  cron { "add_backup_mongo_${::hostname}":
    command => '/root/mongo_backup.sh',
    user    => 'root',
    hour    => '*/2',
    minute  => '0',
    require => File['mongo_backup_script']
  }
}

