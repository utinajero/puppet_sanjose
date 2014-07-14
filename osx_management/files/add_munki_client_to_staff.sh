#!/bin/bash

## repo server
repo="http://ubuntu2.leadps.org/munki_repo/" 
## manifest apps to be managed  
manifest="munki_staff"
## libaray
libaray=/Library/Preferences/ManagedInstalls


### adds the munki repo to the managed software updates
sudo defaults write $libaray SoftwareRepoURL $repo  
### adds the munki production manifest
sudo defaults write $libaray ClientIdentifier $manifest 

exit 0