class windows_desktop_shortcuts::params {

  $absent_shortcuts  = hiera('win_absent_shortcuts')
  $present_shortcuts = hiera('win_present_shortcuts')
  $present_content   = hiera('win_present_content')
  
}
