//
//  UIColor+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (Oksusu)

/**
 *  Ann Blue
 *
 *  @return color for the RGB(0,152,214).
 */
+ (UIColor *)oksusuBlueColor;

/**
 *  colorFromHexString
 *
 *  @return UIColor from hexstring
 */
+ (UIColor *)colorFromHexString:(NSString *)hexString;

/**
 *  colorFromRGB
 *
 *  @return UIColor from rgbvalue
 */
+ (UIColor *)colorFromRGB:(NSInteger)rgbValue;
@end
