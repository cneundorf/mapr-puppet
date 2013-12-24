class mapr::fileserver
{
  notify {"Install mapr-fileserver.":}
  package { 'mapr-fileserver':
  	ensure => installed,
  }
  notify {"Generate Disklist for MapR-FS.":}
  file { '/tmp/disks.txt':
    alias  => 'disks',
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/mapr/disks.txt',
  }

}
