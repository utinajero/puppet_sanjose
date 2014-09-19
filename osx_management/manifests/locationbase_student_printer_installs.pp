class osx_management::locationbase_student_printer_installs inherits params {
  case $::operatingsystem{
    Darwin:{
    ##San Jose LEADPS 
      if ($::network_en0 == $sj_lan) or ($::network_en1 == $sj_lan) {
                
        printer { "SanJose_ARTCLASS":
          ensure      => present,
          uri         => $sj_uri_art_printer,
          description => "SanJose_ARTCLASS",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/Brother HL-6180DW series CUPS.gz",
        }
        
      }
    }
  }
}