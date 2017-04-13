//
//  CommonDefine.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#define STATUSBAR_HEIGHT 20

#define iOS7Delta (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? STATUSBAR_HEIGHT : 0)

#define SCREEN_WIDTH   (CGRectGetWidth([[UIScreen mainScreen] bounds]))
#define SCREEN_HEIGHT  (CGRectGetHeight([[UIScreen mainScreen] bounds]))

#define UIColorFromHex(hexValue)                                                                                       \
    [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0                                               \
                    green:((float)((hexValue & 0xFF00) >> 8)) / 255.0                                                  \
                     blue:((float)(hexValue & 0xFF)) / 255.0                                                           \
                    alpha:1.0]

#define UIColorFromHexWithAlpha(hexValue, alphaValue)                                                                                       \
[UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0                                               \
green:((float)((hexValue & 0xFF00) >> 8)) / 255.0                                                  \
blue:((float)(hexValue & 0xFF)) / 255.0                                                           \
alpha:alphaValue]

#define RGBA(r, g, b, a)	[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b)		[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define HIGHLIGHT_COLOR     [UIColor colorWithRGB:0x00c0cf]

#define PasswordMinLength 6
#define PasswordMaxLength 14

typedef enum {
    ShowType_Push_AnimationYes = 0,
    ShowType_Push_AnimationNo,
    ShowType_Present_AnimationYes,
    ShowType_Present_AnimationNo,
} ShowType;

#endif /* CommonDefine_h */
