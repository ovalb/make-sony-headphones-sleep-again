# Make Sony headphones Sleep again

Sony Wh-1000XM3 are great. But when I close my macbook they don't disconnect, so they don't turn off. Ever. Das mag ich nicht.

## Disclaimer

I did this for myself. It works for me. At the time of this writing I'm on mac os monterey. I didn't test the scripts either. They might just not work for you.
But if you care, lemme know and I'll make some adjustments and hopefully help you fix this.

## Install

1. install sleepwatcher (not from brew, didn't work when I tried) on /usr/local/sbin
2. Clone this repository on your computer
3. Open the source file `disc_bluetooth.m` and add your sony headphones physical address where it says to.

   To find out your device address click The apple icon > About this mac > system report > bluetooth and look for the Address of your device.

4. Run the script `bash INSTALL.sh`
   If it doesn't work try first `chmod +x INSTALL.sh`

5. Enjoy - now you can delete the cloned repo.

## Use

After installation, it just works. It does for me.

## Uninstall

Note: if you want to uninstall this thing:
`bash UNINSTALL.sh`

## End notes

If anyone actually cares, and none of this works, contact me at I'll love to help and/or improve this.
If you know coding, you can make pull requests.
