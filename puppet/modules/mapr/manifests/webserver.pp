class mapr::webserver 
{
  notify {"Install mapr-webserver.":}
  package { 'mapr-webserver':
  	ensure => installed,
  }
}
