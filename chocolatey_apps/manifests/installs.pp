class chocolatey_apps::installs inherits params {
  
  if $::kernel == windows {
    package { "$win_pkgs":
      ensure   => $ensure,
      provider => $provider,
    }
    
    # file { 'install_chocolatey.bat':
    #   path   => 'C:\install_cocolatey.bat',
    #   ensure => present,
    #   source => 'puppet:///modules/chocolatey_apps/files/install_chocolatey.bat',
    # }
    #
    # exec { 'C:\install_cocolatey.bat':
    #   onlyif => 'C:\install_cocolatey.bat',
    #   require => File['install_chocolatey.bat'],
    #   creates =>  "C:\puppet_installed_chocolatey.txt",
    # }
  }
}
