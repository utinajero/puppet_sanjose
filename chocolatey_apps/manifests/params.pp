class chocolatey_apps::params {

  $ensure         = 'latest'
  $provider       = 'chocolatey'
  $win_pkgs       = hiera('win_pkgs')
  $win_game_night = hiera('win_game_night')
  $win_mt_pkgs    = hiera('win_mt_pkgs')
  $win_dev_pkgs   = hiera('win_dev_pkgs')
  
}
