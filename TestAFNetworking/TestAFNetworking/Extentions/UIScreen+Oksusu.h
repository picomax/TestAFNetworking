//
//  UIScreen+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIScreen (Oksusu)

/**
 *  Whether small screen or not
 *
 *  @return boolean depending on whether small screen or not
 */
+ (BOOL)isSmallScreen;

/**
 *  To know screen width
 *
 *  @return float value of screen width
 */
+ (CGFloat)screenWidth;

/**
 *  To know screen height
 *
 *  @return float value of screen height
 */
+ (CGFloat)screenHeight;

/**
 *  To know screen bounds
 *
 *  @return frame object of screen bounds
 */
+ (CGRect)screenBounds;

@end
