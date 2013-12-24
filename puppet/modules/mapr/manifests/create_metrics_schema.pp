class mapr::create_metrics_schema
{

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
## For DEV
$db_host = node03 
notify { "Create Metrics Schema": }
exec { "metrics_schema":
command => "mysql -h localhost -u root -pMapR123 metrics < /opt/mapr/bin/setup.sql",
path    => "/usr/bin/",
}

}
