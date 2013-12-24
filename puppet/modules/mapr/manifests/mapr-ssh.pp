class mapr::mapr-ssh 
{
file { '/home/mapr/.ssh':,
   ensure => 'directory',
   owner => 'mapr',
   group => 'mapr', 
   mode => '700',
}

file { '/home/mapr/.ssh/authorized_keys':,
    source => 'puppet:///modules/mapr/mapr/authorized_keys',
    owner => 'mapr',
    group => 'mapr', 
    mode  => '644',
}   

file { '/home/mapr/.ssh/id_rsa.pub':,
    source => 'puppet:///modules/mapr/mapr/id_rsa.pub',
    owner => 'mapr',
    group => 'mapr',
    mode  => '644',
}

file { '/home/mapr/.ssh/id_rsa':,
    source => 'puppet:///modules/mapr/mapr/id_rsa',
    owner => 'mapr',
    group => 'mapr',
    mode  => '600',
}
}
