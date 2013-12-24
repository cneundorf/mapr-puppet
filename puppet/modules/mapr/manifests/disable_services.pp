class mapr::disable_services
{

notify { "Stop mapr-zookeeper": }
service { 'mapr-zookeeper':
  ensure => 'stopped',
  enable => 'true',
}

notify { "Stop mapr-warden": }
service { 'mapr-warden':
  ensure => 'stopped',
  enable => 'true',
}


}
