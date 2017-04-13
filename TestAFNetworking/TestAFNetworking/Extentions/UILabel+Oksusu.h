//
//  UILabel+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

@interface UILabel (Oksusu)
- (void) removeStrikeThrough:(NSString*)str;
- (void) addStrikeThrough:(NSString*)str;
- (void) addUnderline:(NSString*)str;

- (void)adjustsHeight;
- (void)adjustsWidthWithMax:(CGFloat)max;
- (void)adjustsWidth;

- (CGRect)labelTextSize;
- (CGFloat)labelTextHeightWithBounds:(CGSize)size;
- (void)boldSubstring:(NSString*)substring;
- (void)setHtmlTypeLabel:(NSString*)bodyString size:(float)size color:(NSString*)color aligment:(NSTextAlignment)aligment;
//컬러를 시스템 UIColor 객체 전달하도록 구성, RGB(255, 255, 255) vs. #ffffff
- (void)setHtmlTypeLabel:(NSString*)bodyString size:(float)size uiColor:(UIColor*)uiColor aligment:(NSTextAlignment)aligment;

- (void)setPointAttributeString:(NSString*)text color:(UIColor*)color numberSize:(CGFloat)numberSize pointSize:(CGFloat)pointSize;
- (void)setPointAttributeStringWithColor:(UIColor*)color numberSize:(CGFloat)numberSize pointSize:(CGFloat)pointSize;

@end

