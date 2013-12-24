class { 'ntp':
    servers => [ 'server 0.centos.pool.ntp.org', 'server 1.centos.pool.ntp.org', 'server 2.centos.pool.ntp.org' ],
  }

class { 'jdk_oracle':
  }

class { 'sysadmin': 
  }

class { '::mapr::init': 
}

class { '::mysql::server':
  root_password    => 'MapR123',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
}

    mysql::db { 'mydb':
      user     => 'mapr',
      password => 'mapr',
      host     => 'localhost',
      grant    => ['SELECT', 'UPDATE'],
    }

mysql::db { 'mydb':
      user     => 'mapr',
      password => 'mapr',
      host     => '%',
      grant    => ['SELECT', 'UPDATE'],
    }


mysql_database { 'metrcs':
  ensure  => 'present',
  charset => 'utf8',
}
mysql_grant { 'mapr@localhost/*.*':
  ensure  => 'present',
  options => ['GRANT'],
  privileges => ['ALL'],
  table	     => '*.*',
  user	     => 'mapr@localhost",
}
mysql_grant { 'mapr@%/*.*':
  ensure  => 'present',
  options => ['GRANT'],
  privileges => ['ALL'],
  table      => '*.*',
  user       => 'mapr@%",
}
