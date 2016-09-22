#import <Cordova/CDVPlugin.h>

@interface TapticEngine : CDVPlugin

// Official API
- (void) notification:(CDVInvokedUrlCommand*)command;
- (void) selection:(CDVInvokedUrlCommand*)command;
- (void) impact:(CDVInvokedUrlCommand*)command;

// Unofficial API
- (void) weakBoom:(CDVInvokedUrlCommand*)command;
- (void) strongBoom:(CDVInvokedUrlCommand*)command;
- (void) burst:(CDVInvokedUrlCommand*)command;

@end
