class chocolatey_apps::dev_app_installs inherits params {
  
  if $::kernel == windows {
    package { $win_dev_pkgs:
      ensure   => $ensure,
      provider => $provider,
    }
  }

}