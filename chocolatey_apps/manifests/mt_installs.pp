class chocolatey_apps::mt_installs inherits params {
  
  if $::kernel == windows {
    package { $win_mt_pkgs:
      ensure   => $ensure,
      provider => $provider,
    }
  }
}