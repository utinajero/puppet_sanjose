class meal_time inherits params {
  
  if $osfamily == "windows" {
    if $win_common_desktop_directory {

      file { "${win_common_desktop_directory}\\FAFSA.URL":
        ensure  => present,
        content => "[InternetShortcut]\nURL=$fafsa_url",
      }

    }
  }

}