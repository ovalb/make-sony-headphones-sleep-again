# Reverts everything back to normal

launchctl unload ~/Library/LaunchAgents/com.ovalb.sleepwatcher.plist

mv /usr/local/sbin/disc_bluetooth ~/.Trash
mv /usr/local/sbin/disc_bluetooth.logs ~/.Trash
mv /usr/local/sbin/disc_bluetooth_err.logs ~/.Trash

mv ~/Library/LaunchAgents/com.ovalb.sleepwatcher.plist ~/.Trash

