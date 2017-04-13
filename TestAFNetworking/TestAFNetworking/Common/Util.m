//
//  Util.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "Util.h"
#import "KeychainItemWrapper.h"

@implementation Util
+ (NSString *)getDeviceUUID {
    KeychainItemWrapper *keychainItemWrapper = [[KeychainItemWrapper alloc] initWithIdentifier:@"UUID-Identifier" accessGroup:nil];
    NSString *uuidString = [keychainItemWrapper objectForKey:(__bridge id)(kSecAttrAccount)];
    
    if (uuidString == nil || [uuidString length] == 0) {
        // if there is not UUID in keychain, make UUID and save it.
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        uuidString = [NSString stringWithString:(__bridge NSString *)uuidStringRef];
        CFRelease(uuidStringRef);
        
        // save UUID in keychain
        [keychainItemWrapper setObject:uuidString forKey:(__bridge id)(kSecAttrAccount)];
    }
    
    return uuidString;
}
@end
