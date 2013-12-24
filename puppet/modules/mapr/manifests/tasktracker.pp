class mapr::tasktracker
{
 notify {"Install mapr-tasktracker.":}
  package { 'mapr-tasktracker':
  	ensure => installed,
  }

 notify {"modfiy mapred-site.xml.":}

  file { '/opt/mapr/hadoop/hadoop-0.20.2/conf/mapred-site.xml':
    ensure => present,
    owner  => 'mapr',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/mapr/mapred-site.xml',
  }
}
