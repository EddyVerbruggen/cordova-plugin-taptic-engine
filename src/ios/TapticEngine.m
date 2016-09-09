#import "Cordova/CDV.h"
#import "TapticEngine.h"

@implementation TapticEngine

- (void) weakBoom:(CDVInvokedUrlCommand*)command
{
    AudioServicesPlaySystemSound(1519);
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void) strongBoom:(CDVInvokedUrlCommand*)command
{
    AudioServicesPlaySystemSound(1520);
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void) burst:(CDVInvokedUrlCommand*)command
{
    AudioServicesPlaySystemSound(1521);
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

@end
