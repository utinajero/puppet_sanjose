class chocolatey_apps::params {

  $ensure         = installed
  $provider       = 'chocolatey'
  $win_pkgs       = hiera('win_pkgs')
  $win_game_night = hiera('win_game_night')
  
}
