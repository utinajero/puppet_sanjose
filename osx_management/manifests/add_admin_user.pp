class osx_management::add_admin_user {
## this class only manages 10.9 
  case $macosx_productversion_major{
    10.9:{    
      user { 'admin':
        ensure     => 'present', 
        comment    => 'Administrator',
        gid        => '20',
        groups     => ['_appserveradm', '_appserverusr', '_lpadmin', 'admin'],
        home       => '/var/admin',
        iterations => '29940',
        password   => '3194b4db52571ddb0eccebc514b1ae52774317910e56dd3e3fbac8e6794f08b626d36af20b1e3b48015357c343ec51fc857ddf9981094d749eac2947ae5b60e488bd6d65810f30b85c603104587351adfbd3b0bff0450fb89872f97d3b496a20489e5e4f256ddd50800d72be6033599b0ae3f67af0337522e100776d5f5c9ed8',
        salt       => 'eceff7d98cc652422fcf531ed3ecceae5fea95cd8e56a7e935805d127091ae14',
        shell      => '/bin/bash',
        uid        => '404',
        notify     => Exec['Hide sub-500 users']
      }
    
    # IF you want to change the password of the admin user change it on a test machine and run the command below. Copy new output and change them in the manifests
    #sudo puppet resource user admin | grep iterations -A 2
    }
    10.8:{
      user { 'admin':
        ensure     => 'present',
        comment    => 'admin',
        gid        => '20',
        groups     => ['_appserveradm', '_appserverusr', '_lpadmin', 'admin'],
        home       => '/Users/admin',
        iterations => '19157',
        password   => '8528473465bd6555a734b4d1d8499c30287dabee9d12dd58c763b90efe63899c44b1bde16373333c3ec0ed5f6681813b39368e2dd7636d71e8bf714ce94bb316de67deab1ccd1552210ab511f5eddadfa61c9b251270d8d0e9825174dd27707786ca5fef269fb44027b27f6579423353155390b73e4a056bda4d78d3b2fd51b6',
        salt       => '45d9ad5ab8f06f4e426021c5832de3f8ffb441d349d7495197e08ff298f5ed76',
        shell      => '/bin/bash',
        uid        => '404',
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
