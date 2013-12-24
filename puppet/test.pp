class { '::mysql::server':
  root_password    => 'MapR123',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
}


mysql::db { 'mysql':
      user     => 'mapr',
      password => 'mapr',
      host     => 'localhost',
      grant    => ['SELECT', 'UPDATE'],
    }



mysql_database { 'metrics':
  ensure  => 'present',
  charset => 'utf8',
}

mysql_grant { 'mapr@localhost/*.*':
  ensure  => 'present',
  options => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'mapr@localhost',
}

