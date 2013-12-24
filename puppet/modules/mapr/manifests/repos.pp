class mapr::repos
{

  file { '/etc/yum.repos.d/maprtech.repo':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    #source => 'puppet:///modules/mapr/maprtech.repo',
    source => 'puppet:///modules/mapr/maprlocal.repo',
  }
}
