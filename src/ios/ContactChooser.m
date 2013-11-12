#import "ContactChooser.h"
#import <Cordova/CDVAvailability.h>

@implementation ContactChooser
@synthesize callbackID;

- (void) chooseContact:(CDVInvokedUrlCommand*)command{
    self.callbackID = command.callbackId;
    
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    [self.viewController presentModalViewController:picker animated:YES];
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonEmailProperty);
    NSString *email = (__bridge NSString *)ABMultiValueCopyValueAtIndex(multi, 0);
    if (!email)
        email = @"";
    NSString *displayName = (__bridge NSString *)ABRecordCopyCompositeName(person);
    ABMultiValueRef multiPhones = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString* phoneNumber = @"";
    if (ABMultiValueGetCount(multiPhones) > 0) {
        phoneNumber = (__bridge NSString *)ABMultiValueCopyValueAtIndex(multiPhones, 0);
    }

    NSMutableDictionary* contact = [NSMutableDictionary dictionaryWithCapacity:2];
    [contact setObject:email forKey: @"email"];
    [contact setObject:displayName forKey: @"displayName"];
    [contact setObject:phoneNumber forKey: @"phoneNumber"];

    [super writeJavascript:[[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:contact] toSuccessCallbackString:self.callbackID]];
    [self.viewController dismissModalViewControllerAnimated:YES];
    return NO;
}

- (BOOL) personViewController:(ABPersonViewController*)personView shouldPerformDefaultActionForPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifierForValue
{
    return YES;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [self.viewController dismissModalViewControllerAnimated:YES];
    [super writeJavascript:[[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR
                                                              messageAsString:@"People picker abort"]
                                            toErrorCallbackString:self.callbackID]];
}

@end
