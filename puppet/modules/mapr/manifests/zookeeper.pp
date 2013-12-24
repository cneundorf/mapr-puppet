class mapr::zookeeper 
{
  notify {"Install mapr-zookeeper.":}
  package { 'mapr-zookeeper':
  	ensure => installed,
  }
}
