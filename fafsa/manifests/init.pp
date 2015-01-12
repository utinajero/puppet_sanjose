class fafsa inherits params {
  
  if $osfamily == "windows" {
    if $win_common_desktop_directory {

      file { "${win_common_desktop_directory}\\FAFSA.URL":
        ensure  => present,
        content => "[InternetShortcut]\nURL=$fafsa_url",
      }
      
      file { "${win_common_desktop_directory}\\DREAM_ACT.URL":
        ensure => present,
        content => "[InternetShortcut]\nURL=https://dream.csac.ca.gov/",
      }

    }
  }

}