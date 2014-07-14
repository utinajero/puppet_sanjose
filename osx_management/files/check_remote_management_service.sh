#!/bin/bash
# hope this is useful to others 
remote=$(launchctl list | grep '^\d.*RemoteDesktop.*' | grep -o com.apple.RemoteDesktop.agent)

##change user to something you will be using 
## ie. vagrant,admin or admin or ladmin,admin or uname,uname,uname,uname...
user='admin'
ard=$(/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off && /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users $user -privs -all -restart -agent -menu)

## enable for all users 
#ard=$(/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -restart -agent -privs -all)

## Activate Remote Desktop Sharing, disable access privileges for all users:
#ard=$(/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -off)

## If you just want to stop the ARD Agent process:
#ard=$(/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -agent -stop)

## If you want to deactivate it:
#ard=$(/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -configure -access -off)

## Apple Remote Desktop 3.2 or later only: Allow access for all users and give all users full access
# /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all

## Apple Remote Desktop 3.2 or later only: Allow access for only a specific set of users.
# /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -specifiedUsers
## The set of users must be specified in a separate command using the -configure, -access and -privs options. For example, this command gives the users with the short names "teacher" and "student" access to observe (but not control) the machine and to send text messages:
# sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -users teacher,student -access -on -privs -ControlObserve -ObserveOnly -TextMessages

## MORE INFO AT /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -help

if [[ $remote == "com.apple.RemoteDesktop.agent" ]]
  then
    exit 0
  else
    $ard
fi

exit 0