class mapr::enable_services
{

notify { "Start mapr-warden": }
service { 'mapr-warden':
  ensure => 'running',
  enable => 'true',
}


notify { "Start mapr-zookeeper": }
service { 'mapr-zookeeper':
  ensure => 'running',
  enable => 'true',
}


}
