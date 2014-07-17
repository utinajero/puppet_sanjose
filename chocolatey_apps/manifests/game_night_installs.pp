class chocolatey_apps::game_night_installs inherits params {
  
  if $::kernel == windows {
    package { $win_game_night:
      ensure   => $ensure,
      provider => $provider,
    }
  }

}