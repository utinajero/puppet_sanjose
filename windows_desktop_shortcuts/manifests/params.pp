class windows_desktop_shortcuts::params {

  $absent_shortcuts  = hiera('')
  $present_shortcuts = hiera('win_present_shortcuts')
  $present_content   = hiera('win_present_content')
  
}
