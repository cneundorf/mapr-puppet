class mapr::user_mapr
{



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


}                                                              
