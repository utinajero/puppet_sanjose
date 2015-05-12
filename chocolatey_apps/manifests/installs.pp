class chocolatey_apps::installs inherits params {
  
  if $::kernel == windows {
    package { "$win_pkgs":
      ensure   => $ensure,
      provider => $provider,
    }
  }
}
