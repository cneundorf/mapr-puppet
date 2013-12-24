class mapr::environment
{

  file { '/opt/mapr/conf/env.sh':
    ensure => present,
    owner  => 'mapr',
    group  => 'mapr',
    mode   => '0644',
    source => 'puppet:///modules/mapr/env.sh',
  }
}
