//
//  NSURLRequest+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "NSURLRequest+Oksusu.h"

@implementation NSURLRequest (Oksusu)

- (BOOL)hasHeader:(NSString *)headerName {
    NSDictionary *headers = [self allHTTPHeaderFields];
    for(NSString *key in [headers allKeys]) {
        if([key isEqualToString:headerName] == YES) {
            return YES;
        }
    }
    return NO;
}

@end
