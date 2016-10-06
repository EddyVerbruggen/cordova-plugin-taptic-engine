#import <Cordova/CDVPlugin.h>

@interface TapticEngine : CDVPlugin

// Official API
- (void) notification:(CDVInvokedUrlCommand*)command;
- (void) selection:(CDVInvokedUrlCommand*)command;
- (void) impact:(CDVInvokedUrlCommand*)command;

- (void) gestureSelectionStart:(CDVInvokedUrlCommand*)command;
- (void) gestureSelectionChanged:(CDVInvokedUrlCommand*)command;
- (void) gestureSelectionEnd:(CDVInvokedUrlCommand*)command;

// Unofficial API
- (void) weakBoom:(CDVInvokedUrlCommand*)command;
- (void) strongBoom:(CDVInvokedUrlCommand*)command;
- (void) burst:(CDVInvokedUrlCommand*)command;

// This property stores a selection feedback generator during
// gestures, as per https://developer.apple.com/reference/uikit/uifeedbackgenerator#2555399
@property UISelectionFeedbackGenerator *selectionGenerator;

@end
