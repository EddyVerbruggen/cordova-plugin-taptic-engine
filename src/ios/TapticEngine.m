#import <AudioToolbox/AudioToolbox.h>
#import "Cordova/CDV.h"
#import "TapticEngine.h"

@implementation TapticEngine

#if (TARGET_OS_SIMULATOR)
BOOL isSimulator = YES;
#endif

#if !(TARGET_OS_SIMULATOR)
BOOL isSimulator = NO;
#endif

#pragma mark - Official API (for iPhone 7 and up)
- (void) notification:(CDVInvokedUrlCommand *)command
{
  // Note that the generator will be nil on iOS < 10, but there's no point in checking
  // availability otherwise, it's also discouraged to check for availability:
  // https://developer.apple.com/reference/uikit/uifeedbackgenerator

  UINotificationFeedbackGenerator *generator = [UINotificationFeedbackGenerator new];
  if (generator == nil || isSimulator) {
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unsupported Operating System"] callbackId:command.callbackId];
    return;
  }

  NSDictionary* options = command.arguments[0];
  NSString *type = options[@"type"];
  UINotificationFeedbackType feedbackType = UINotificationFeedbackTypeSuccess; // default
  if (type != nil) {
    if ([type isEqualToString:@"warning"]) {
      feedbackType = UINotificationFeedbackTypeWarning;
    } else if ([type isEqualToString:@"error"]) {
      feedbackType = UINotificationFeedbackTypeError;
    }
  }

  [generator notificationOccurred:feedbackType];
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

/**
 * Trigger selection feedback in one burst, useful for non-gesture based
 * selection feedback.
 */
- (void) selection:(CDVInvokedUrlCommand *)command
{
  UISelectionFeedbackGenerator *generator = [UISelectionFeedbackGenerator new];
  if (generator == nil || isSimulator) {
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unsupported Operating System"] callbackId:command.callbackId];
    return;
  }

  [generator selectionChanged];
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}


/**
 * Used to prepare a taptic event for future taptic events in a gesture.
 */
- (void) gestureSelectionStart:(CDVInvokedUrlCommand *)command
{
    if (!self.selectionGenerator) {
        self.selectionGenerator = [UISelectionFeedbackGenerator new];
        if (self.selectionGenerator == nil || isSimulator) {
            [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unsupported Operating System"] callbackId:command.callbackId];
            return;
        }
    }

    [self.selectionGenerator prepare];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

/**
 * While in a gesture, we can efficiently trigger a selection taptic event.
* gestureSelectionStart should be called first.
 */
- (void) gestureSelectionChanged:(CDVInvokedUrlCommand *)command
{
    if (!self.selectionGenerator) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invoke gestureSelectionStart first"] callbackId:command.callbackId];
        return;
    }

    [self.selectionGenerator selectionChanged];
    [self.selectionGenerator prepare];

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

/**
 * Called at the end of a gesture to clean up the taptic reference.
 */
- (void) gestureSelectionEnd:(CDVInvokedUrlCommand *)command
{
    // Free up the selection generator
    self.selectionGenerator = nil;

    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void) impact:(CDVInvokedUrlCommand *)command
{
  NSDictionary* options = command.arguments[0];
  NSString *style = options[@"style"];
  UIImpactFeedbackStyle feedbackStyle = UIImpactFeedbackStyleMedium; // default
  if (style != nil) {
    if ([style isEqualToString:@"light"]) {
      feedbackStyle = UIImpactFeedbackStyleLight;
    } else if ([style isEqualToString:@"heavy"]) {
      feedbackStyle = UIImpactFeedbackStyleHeavy;
    } else if ([style isEqualToString:@"rigid"]) {
      feedbackStyle = UIImpactFeedbackStyleRigid;
    } else if ([style isEqualToString:@"soft"]) {
      feedbackStyle = UIImpactFeedbackStyleSoft;
    }
  }

  UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:feedbackStyle];
  if (generator == nil || isSimulator) {
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unsupported Operating System"] callbackId:command.callbackId];
    return;
  }

  [generator impactOccurred];
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

#pragma mark - Unofficial API (for iPhone 6s and up)
- (void) weakBoom:(CDVInvokedUrlCommand*)command
{
  AudioServicesPlaySystemSound(1000 + 500 + 19);
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void) strongBoom:(CDVInvokedUrlCommand*)command
{
  AudioServicesPlaySystemSound(1000 + 500 + 20);
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

- (void) burst:(CDVInvokedUrlCommand*)command
{
  AudioServicesPlaySystemSound(1000 + 500 + 21);
  [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

@end
