class meal_time {
  
  if $osfamily == "windows" {
    if $win_common_desktop_directory {

      file { "${win_common_desktop_directory}\\MealTime.URL":
        ensure  => present,
        content => "[InternetShortcut]\nURL=http://mealtime.com",
      }

    }
  }

}