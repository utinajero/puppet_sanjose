class map_test {
  
  if $osfamily == "windows" {
    if $win_common_desktop_directory {

      file { "${win_common_desktop_directory}\\map_test.lnk":
        ensure => present,
        source => "puppet:///modules/map_test/map_test.lnk",
      }

    }
  }
}