class windows_desktop_shortcuts::mt_shortcut {
  if $::osfamily == "windows" {
    if $::win_common_desktop_directory {

      # shortcuts that should be absent
      file { "${win_common_desktop_directory}\\PuppetLabs.URL":
        ensure  => absent,
        content => "[InternetShortcut]\nURL=http://puppetlabs.com",
      }
      # shortcuts that should be present 
      file { "${win_common_desktop_directory}\\Google.URL":
        ensure   => presnet,
        conntent => "[InternetShortcut]\nURL=http://google.com", 
      }
    }
  }
}
