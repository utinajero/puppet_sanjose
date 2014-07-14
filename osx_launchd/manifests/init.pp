class osx_launchd {
	file { '/Library/LaunchDaemons/com.puppetlabs.puppet.plist':
		ensure => 'present',
		source => 'puppet:///modules/osx_launchd/com.puppetlabs.puppet.plist',
		mode   => '0644',
    owner  => 'root',
    group  => 'wheel',
    notify => Exec['load-launchd']
	}
	
	exec { 'load-launchd':
		cwd          => '/Library/LaunchDaemons/',
  	command      => '/bin/launchctl load -w /Library/LaunchDaemons/com.puppetlabs.puppet.plist',
		refreshonly => true,
	}
	
	cron { 'run puppet':
    ensure   => 'absent',
		user     => 'root',	
		command  => '/usr/bin/puppet agent -t',
		minute   => '*/30',
		hour     => '*',
	}
}
