class mapr::nfs 
{

  $package_names = ['mapr-nfs']
  $excluded_services = ['nfs' ]

  notify {"Install mapr-nfs.":}

  package { $package_names:
  	ensure => installed,
  }

  # mapr nfs cannot be ran alongside linux nfs so we have to ensure nfs is
  # stopped see:
  # http://www.mapr.com/doc/display/MapR/Configuring+the+Cluster
  # for more information
  notify {"Disable Linux NFS.":}
  service { $excluded_services:
  	ensure => stopped,
    enable => false
  }
}
