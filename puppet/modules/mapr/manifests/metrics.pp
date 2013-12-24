class mapr::metrics 
{
  notify {"Install mapr-metrics.":}
  package { 'mapr-metrics':
  	ensure => installed,
  }
}
