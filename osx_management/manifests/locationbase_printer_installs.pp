class osx_management::locationbase_printer_installs {
	case $operatingsystem{
		Darwin:{
		##San Jose LEADPS is on the 10.3.0.0 and 10.3.0.0 Subnets
			if ($network_en0 == '10.3.0.0') or ($network_en1 == '10.3.0.0') {
				printer { "SanJose_StaffRoom":
					ensure      => present,
					uri         => "lpd://10.3.0.7",
					description => "SanJose_StaffRoom_Copier",
					shared      => false,
					ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 8000", # PPD file will be autorequired
				}
				printer { "SanJose_Office":
					ensure      => present,
					uri         => "lpd://10.3.0.4",
					description => "SanJose_Office_Copier",
					shared      => false,
					ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 8000", # PPD file will be autorequired
				}
			}
			
		##Hayward LEADPS is on the 10.5.0.0 Subnet
			if ($network_en0 == '10.5.0.0') or ($network_en1 == '10.5.0.0'){
				printer { "Hayward_Office":
					ensure      => present,
					uri         => "lpd://10.5.0.17",
					description => "Xerox 550",
					shared      => false,
					ppd         => "/Library/Printers/PPDs/Contents/Resources/RICOH Aficio MP 7500", # PPD file will be autorequired
				}
			}
		}
	}
}