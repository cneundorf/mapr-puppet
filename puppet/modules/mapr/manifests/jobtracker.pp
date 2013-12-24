class mapr::jobtracker 
{
  package { 'mapr-jobtracker':
  	ensure => installed,
#  	require => file['/etc/yum.repos.d/maprtech.repo'],
  }

}
