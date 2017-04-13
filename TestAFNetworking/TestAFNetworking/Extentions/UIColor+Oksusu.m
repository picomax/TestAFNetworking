//
//  UIColor+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIColor+Oksusu.h"

@implementation UIColor (Oksusu)

+ (UIColor *)oksusuBlueColor {
    return [UIColor colorWithRed:0 / 255.0 green:152 / 255.0 blue:214 / 255.0 alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    
    if([hexString indexOf:@"#"] > -1){
        // bypass '#' character
        [scanner setScanLocation:1];
    }else{
        [scanner setScanLocation:0];
    }
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0
                    green:((float)((rgbValue & 0x00FF00) >>  8))/255.0
                     blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0
                    alpha:1.0];
}


@end
