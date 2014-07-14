class osx_management::params {

  $macadmin = 'admin'
  $ensure   = 'present'
  $comment  = 'Administrator'
  $gid      = '20'
  $groups   = ['_appserveradm', '_appserverusr', '_lpadmin', 'admin']
  $home     = '/var/admin'
  $shell    = '/bin/bash'
  $uid      = '404'
  
  if $::macosx_productversion_major == '10.9' {
    $iterations = hiera('iterations_mav')
    $salt       = hiera('salt_mav')
    $password   = hiera('password_mav')
  } elsif $::macosx_productversion_major == '10.8'{
    $iterations = hiera('iterations_ml')
    $password   = hiera('password_ml')
    $salt       = hiera('salt_ml') 
  }
}
