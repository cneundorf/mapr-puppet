class mapr::hbase-regionserver
 {
  $package_names = [ 'mapr-hbase-regionserver' ]

  notify {"install Hbase RegionServer":}
  package { $package_names:
  	ensure => installed,
  }
}
