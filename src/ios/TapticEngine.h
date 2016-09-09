#import <Cordova/CDVPlugin.h>

@interface TapticEngine : CDVPlugin

- (void) weakBoom:(CDVInvokedUrlCommand*)command;
- (void) strongBoom:(CDVInvokedUrlCommand*)command;
- (void) burst:(CDVInvokedUrlCommand*)command;

@end
