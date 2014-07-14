class chocolatey_apps::installs inherits params {
  
  if $::kernel == windows {
    package { $win_pkgs:
      ensure   => $ensure,
      provider => $provider,
    }

    # enable during game
    # package { $windows_game_night: 
    #   ensure   => $ensure,
    #   provider => $provider,
    # } 
  }
}
