# show device address
echo "device address -> "
cat disc_bluetooth.m | grep "NSString" | cut -d' ' -f4

INSTALL_PATH=/usr/local/sbin

# check whether sleepwatcher is installed
FILE = /usr/local/sbin/sleepwatcher
if [! -f "$FILE" ]; then
 echo "/usr/local/sbin/sleepwatcher does not exist. Install sleepwatcher in that location."
 exit
fi

#compile the binary
clang -framework Foundation -framework -IOBluetooth disc_bluetooth.m -o disc_bluetooth

# move the binary to install path
chmod +x disc_bluetooth
cp disc_bluetooth $INSTALL_PATH/

# move launchctl file into /Library/LaunchAgents
cp com.ovalb.sleepwatcher.plist ~/Library/LaunchAgents

# load the module
launchctl load ~/Library/LaunchAgents/com.ovalb.sleepwatcher.plist

#print enjoy
echo "Enjoy!"
