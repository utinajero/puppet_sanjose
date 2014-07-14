class chocolatey_apps::params {

  $ensure             = installed
  $provider           = 'chocolatey'
  $win_pkgs           = hiera('win_pkgs')
  $windows_game_night = hiera('windows_game_night')
  
}
