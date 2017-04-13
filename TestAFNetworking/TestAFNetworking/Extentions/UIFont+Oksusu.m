//
//  UIFont+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIFont+Oksusu.h"

@implementation UIFont (Oksusu)

+ (UIFont *)oksusuFontOfSize:(CGFloat)fontSize
{
    return [self systemFontOfSize:fontSize];
    //	return [self fontWithName:@"SKPGoMM" size:fontSize];
}

+ (UIFont *)boldOksusuFontOfSize:(CGFloat)fontSize
{
    return [self boldSystemFontOfSize:fontSize];
    //	return [self fontWithName:@"SKPGoBM" size:fontSize];
}

@end

