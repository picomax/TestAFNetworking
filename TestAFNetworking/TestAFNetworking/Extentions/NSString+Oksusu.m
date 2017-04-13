//
//  NSString+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "NSString+Oksusu.h"

@implementation NSString (Oksusu)
- (NSInteger)indexOf:(NSString *)text {
    NSRange range = [self rangeOfString:text];
    if ( range.length > 0 ) {
        return range.location;
    }
    
    return -1;
}

- (BOOL)isEmpty {

    if ((NSNull *)self == [NSNull null]) {
        return YES;
    }
    if (self == nil) {
        return YES;
    }
    if ([self length] == 0) {
        return YES;
    }
    NSString *tmpStr = [self copy];
    if ([[tmpStr stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

@end
