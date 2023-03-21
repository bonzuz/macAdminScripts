#!/bin/bash
## Get logged in user
consoleUser() {
	echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }'
}
user=$(consoleUser)

icloudaccount=$(sudo -u "$user" defaults read | grep "App Store Product Source Accounts:" | head -1 | awk '/Accounts:/ { print $6 } ' | cut -d '"' -f 1 )

if [ -z "$icloudaccount" ] 
then
    echo "<result>No Accounts</result>"
else
    echo "<result>${icloudaccount}</result>"
fi

