class osx_management::remote_management {
##change user to something you will be using 
## ie. ladmin,admin or uname,uname,uname,uname...
	#$user = 'admin'
  
	# script that cron uses for local check of service 
  ## only runs if the service is ever disabled 
  file { '/usr/bin/check_remote_management_service':
    #ensure   => 'present',
    ensure   => 'absent',
    mode     => '0755',
    source   => 'puppet:///modules/osx_management/check_remote_management_service.sh',
    notify   => Exec['kickstart-remote-management'],
  }
	
  ## Disables and removes any current Remote Management settings and Enables Remote Management with what you want  
  ## change the command if you want access to all users 
  ## enable for all users 
  #/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -restart -agent -privs -all
  
  exec { 'kickstart-remote-management':
    command     => "/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off && /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users admin -privs -all -restart -agent -menu",
    refreshonly => true,
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