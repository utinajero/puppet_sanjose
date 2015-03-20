class osx_management::params {

  #local admin account 
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
  } elsif $::macosx_productversion_major == '10.10' {
    $iterations = hiera('iterations_yosemite')
    $password   = hiera('password_yosemite')
    $salt       = hiera('salt_yosemite') 
  }
    
   
  
  # printers 
  $sj_lan                = hiera('sj_lan')
  $sj_uri_staff_printer  = hiera('sj_uri_staff_printer')
  $sj_uri_office_printer = hiera('sj_uri_office_printer')
  $sj_uri_pclab_printer  = hiera('sj_uri_pclab_printer')
  $sj_uri_art_printer    = hiera('sj_uri_art_printer')
  #$sj_uri_student_services_printer = hiera('sj_uri_student_services_printer') removed
  $sj_uri_principal_printer = hiera('sj_uri_principal_printer')
  $hy_lan                = hiera('hy_lan')
  $hy_uri_office_printer = hiera('hy_uri_office_printer')
}
