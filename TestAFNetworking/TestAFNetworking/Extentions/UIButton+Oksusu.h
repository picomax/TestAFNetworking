//
//  UIButton+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Oksusu)
- (void) stretchBackgroundImageName:(NSString*)normalImageStr;
- (void) stretchBackgroundImageName:(NSString*)normalImageStr highlitedImageStr:(NSString*)highlitedImageStr selectedImageStr:(NSString*)selectedImageStr;

- (void)adjustsRight;
- (void)exchangeImageAndTitle;
- (void)adjustsVerticalCenterWithSpaceH:(CGFloat)spaceH;
- (void)adjustsVerticalCenterWithSpaceH:(CGFloat)spaceH correctX:(CGFloat)correctX;

@end
