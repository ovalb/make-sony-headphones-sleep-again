// This code has been shamelessly stolen from https://github.com/toy/blueutil
// I just didn't wanna import the whole thing and I also wanted to learn how this stuff works.

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface DeviceNotificationRunLoopStopper : NSObject
@end
@implementation DeviceNotificationRunLoopStopper {
}
- (void)notification:(IOBluetoothUserNotification *)notification fromDevice:(IOBluetoothDevice *)device {
    [notification unregister];
    CFRunLoopStop(CFRunLoopGetCurrent());
}
@end

int main(int argc, const char *argv[]) {
	/* **********************************************************
	* TODO: INSERT BELOW YOUR DEVICE ADDRESS ********************
	* ***********************************************************/
	NSString *deviceAddress = @"14:3f:a6:90:a1:c9"

	IOBluetoothDevice *device = [IOBluetoothDevice deviceWithAddressString:deviceAddress];
	if (device != nil) {
		NSLog(@"%@", [device name]);
	} else {
		NSLog(@"Device not found");
	}

	// synchronous close connection
	if ([ device closeConnection ] != kIOReturnSuccess) {
		NSLog(@"Error closing connection");
		return -1;
	}

	// Now the async part
	// What is the alloc thing?
	 DeviceNotificationRunLoopStopper *stopper =
              [[DeviceNotificationRunLoopStopper alloc] init];

	@autoreleasepool {
		CFRunLoopTimerRef timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, 0, 0, 0, 0, ^(__unused CFRunLoopTimerRef timer) {
			if ([device isConnected]) {
				[device registerForDisconnectNotification:stopper selector:@selector(notification:fromDevice:)];
			} else {
				CFRunLoopStop(CFRunLoopGetCurrent());
			}
		});
		
		CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopDefaultMode);
		CFRunLoopRun();

		// I'm assuming it will stop asynchronously

		CFRunLoopRemoveTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopDefaultMode);
		CFRelease(timer);
	}

	return 0;
}
