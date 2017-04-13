//
//  UIScreen+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIScreen+Oksusu.h"

@implementation UIScreen (Oksusu)

+ (BOOL)isSmallScreen {
    if ([[self mainScreen] bounds].size.height <= 480) {
        return YES;
    }
    return NO;
}

+ (CGFloat)screenWidth {
    return [[self mainScreen] bounds].size.width;
}

+ (CGFloat)screenHeight {
    return [[self mainScreen] bounds].size.height;
}

+ (CGRect)screenBounds {
    return [[self mainScreen] bounds];
}

@end
