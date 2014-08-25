class osx_management::locationbase_printer_installs inherits params {
  case $::operatingsystem{
    Darwin:{
    ##San Jose LEADPS is on the 10.3.0.0 and 10.3.0.0 Subnets
      if ($::network_en0 == $sj_lan) or ($::network_en1 == $sj_lan) {
        printer { "SanJose_StaffRoom":
          ensure      => present,
          uri         => $sj_uri_staff_printer,
          description => "SanJose_StaffRoom_Copier",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 8000", # PPD file will be autorequired
        }
        printer { "SanJose_Office":
          ensure      => present,
          uri         => $sj_uri_office_printer,
          description => "SanJose_Office_Copier",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 8000", # PPD file will be autorequired
        }
        
        printer { "SanJose_PCLab":
          ensure      => present,
          uri         => $sj_uri_pclab_printer,
          description => "SanJose_PCLab",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/Brother HL-6180DW series CUPS.gz",
        }
        
        printer { "SanJose_PCLab":
          ensure      => present,
          uri         => $sj_uri_student_services_printer,
          description => "SanJose_Student_Services",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/Brother HL-6180DW series CUPS.gz",
        }
        
      }
      
    ##Hayward LEADPS is on the 10.5.0.0 Subnet
      if ($::network_en0 == $hy_lan) or ($::network_en1 == $hy_lan){
        printer { "Hayward_Office":
          ensure      => present,
          uri         => $hy_uri_office_printer,
          description => "Xerox 550",
          shared      => false,
          ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 7500", # PPD file will be autorequired
        }
      }
    }
  }
}