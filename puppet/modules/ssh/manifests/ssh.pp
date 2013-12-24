package {'openssh':
	ensure => installed,
}

file { '/etc/ssh/ssh_config':
	source => 'puppet:///modules/ssh/ssh_config',
	owner => 'root',
	group => 'root',
	mode  => '640',
	require => Package ['openssh'],
}

