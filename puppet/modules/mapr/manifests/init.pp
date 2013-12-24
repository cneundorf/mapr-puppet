# Service account for mapr service
# The mapr-warden service handles starting the actual mapr services so the
# classes for each service should be ran first while the warden class is run
# last
class mapr
{

#FIXME: add  stage => pre

  user { 'mapr':
    uid        => '2000',
    gid        => '2000',
    comment    => 'Service account for mapr',
    home       => '/home/mapr',
    shell      => '/bin/bash',
    managehome => true,
    password => 'MapR123',
  }

  group { 'mapr':
    gid => '2000'
  }


  file { '/etc/yum.repos.d/maprtech.repo':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    #source => 'puppet:///modules/mapr/maprtech.repo',
    source => 'puppet:///modules/mapr/maprlocal.repo',
  }
}
