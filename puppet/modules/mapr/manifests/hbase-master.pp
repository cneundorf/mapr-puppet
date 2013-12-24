class mapr::hbase-master 
{
  package { 'mapr-hbase-master':
  	ensure => installed,
#  	require => File['/etc/yum.repos.d/maprtech.repo'],
  }
}
