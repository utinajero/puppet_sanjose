class osx_management::remote_management inherits params {
  
	# script that cron uses for local check of service 
  ## only runs if the service is ever disabled 
  file { '/usr/bin/check_remote_management_service':
    #ensure   => 'present',
    ensure   => 'absent',
    mode     => '0755',
    source   => 'puppet:///modules/osx_management/check_remote_management_service.sh',
  }
	
  ## active local check. Test for Remote Management to be enabled 
  cron { 'test-remote-management-service':
    #ensure   => 'present',
    ensure  => 'absent',
    user     => 'root',	
    command  => '/usr/bin/check_remote_management_service >/dev/null 2>&1',
    minute   => '30',
    hour     => '*',
  }
}