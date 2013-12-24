class mapr::root-ssh 
{
file { '/root/.ssh':,
   ensure => 'directory',
   owner => 'root',
   group => 'root', 
   mode => '700',
}

file { '/root/.ssh/authorized_keys':,
    source => 'puppet:///modules/mapr/root/authorized_keys',
    owner => 'root',
    group => 'root', 
    mode  => '644',
}   

file { '/root/.ssh/id_rsa.pub':,
    source => 'puppet:///modules/mapr/root/id_rsa.pub',
    owner => 'root',
    group => 'root',
    mode  => '644',
}

file { '/root/.ssh/id_rsa':,
    source => 'puppet:///modules/mapr/root/id_rsa',
    owner => 'root',
    group => 'root',
    mode  => '600',
}
}
