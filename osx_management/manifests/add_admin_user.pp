class osx_management::add_admin_user inherits params {
## this class only manages 10.9 
  case $macosx_productversion_major{
    10.10:{    
      user { $macadmin:
        ensure     => $ensure, 
        comment    => $comment,
        gid        => $gid,
        groups     => $groups,
        home       => $home,
        iterations => $iterations,
        password   => $password,
        salt       => $salt,
        shell      => $shell,
        uid        => $uid,
        notify     => Exec['Hide sub-500 users']
      }
    
    10.9:{    
      user { $macadmin:
        ensure     => $ensure, 
        comment    => $comment,
        gid        => $gid,
        groups     => $groups,
        home       => $home,
        iterations => $iterations,
        password   => $password,
        salt       => $salt,
        shell      => $shell,
        uid        => $uid,
        notify     => Exec['Hide sub-500 users']
      }
    
    # IF you want to change the password of the admin user change it on a test machine and run the command below. Copy new output and change them in the manifests
    #sudo puppet resource user admin | grep iterations -A 2
    }
    10.8:{
      user { $macadmin:
        ensure     => $ensure, 
        comment    => $comment,
        gid        => $gid,
        groups     => $groups,
        home       => $home,
        iterations => $iterations,
        password   => $password,
        salt       => $salt,
        shell      => $shell,
        uid        => $uid,
        notify     => Exec['Hide sub-500 users']
      }
    }
  }
  exec {'Hide sub-500 users':
    command     => "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool TRUE",
    refreshonly => true,
  }
  
  file { '/var/admin':
    ensure => directory,
    owner => 'admin',
  }
}
