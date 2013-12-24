class mapr::hbase
{
  package { 'mapr-hbase':
        ensure => installed,
 #       require => File['/etc/yum.repos.d/maprtech.repo'],
  }
}
