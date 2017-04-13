//
//  UIButton+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIButton+Oksusu.h"
#define kSpaceW	3

@implementation UIButton (Oksusu)

- (void) stretchBackgroundImageName:(NSString*)normalImageStr {
    [self stretchBackgroundImageName:normalImageStr highlitedImageStr:nil selectedImageStr:nil];
}

- (void) stretchBackgroundImageName:(NSString*)normalImageStr highlitedImageStr:(NSString*)highlitedImageStr selectedImageStr:(NSString*)selectedImageStr {
    
    if (normalImageStr != nil) {
        UIImage * norImage = [UIImage imageNamed:normalImageStr];
        norImage = [norImage stretchableImageWithLeftCapWidth:floorf(norImage.size.width/2) topCapHeight:floorf(norImage.size.height/2)];
        [self setBackgroundImage:norImage forState:UIControlStateNormal];
    }
    
    if (highlitedImageStr != nil) {
        UIImage *preImage = [UIImage imageNamed:highlitedImageStr];
        preImage = [preImage stretchableImageWithLeftCapWidth:floorf(preImage.size.width/2) topCapHeight:floorf(preImage.size.height/2)];
        [self setBackgroundImage:preImage forState:UIControlStateHighlighted];
    }
    
    if (selectedImageStr != nil) {
        UIImage *selImage = [UIImage imageNamed:selectedImageStr];
        selImage = [selImage stretchableImageWithLeftCapWidth:floorf(selImage.size.width/2) topCapHeight:floorf(selImage.size.height/2)];
        [self setBackgroundImage:selImage forState:UIControlStateSelected];
    }
}

- (void)adjustsRight
{
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    CGSize	imageSize_	= [self imageForState:UIControlStateNormal].size;
    CGSize	titleSize_	= [[self titleForState:UIControlStateNormal] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 0)
                                                                                options:(NSStringDrawingUsesLineFragmentOrigin|
                                                                                         NSStringDrawingUsesFontLeading)
                                                                             attributes:@{NSFontAttributeName:self.titleLabel.font}
                                                                                context:nil].size;
    //    [[self titleForState:UIControlStateNormal] sizeWithFont:self.titleLabel.font forWidth:CGFLOAT_MAX lineBreakMode:self.titleLabel.lineBreakMode];
    CGFloat sumW_ = imageSize_.width + titleSize_.width;
    CGFloat fixW_ = (self.frameWidth - sumW_)/2;
    
    imageSize_.width -= fixW_ - kSpaceW;
    titleSize_.width += fixW_;
    
    self.titleEdgeInsets	= UIEdgeInsetsMake(0, -imageSize_.width, -2, imageSize_.width);
    self.imageEdgeInsets	= UIEdgeInsetsMake(0, titleSize_.width, 0, -titleSize_.width);
}

- (void)exchangeImageAndTitle {
    CGSize	imageSize_	= [self imageForState:UIControlStateNormal].size;
    self.imageEdgeInsets = UIEdgeInsetsMake(0., self.frame.size.width - imageSize_.width, 0., 0.);
    self.titleEdgeInsets = UIEdgeInsetsMake(0., 0., 0., imageSize_.width);
}

- (void)adjustsVerticalCenterWithSpaceH:(CGFloat)spaceH correctX:(CGFloat)correctX {
    CGSize	imageSize_	= [self imageForState:UIControlStateNormal].size;
    CGSize  titleSize_;
    titleSize_ = [[self titleForState:UIControlStateNormal] boundingRectWithSize:(CGSize){CGFLOAT_MAX, self.frameHeight} options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.titleLabel.font} context:nil].size;
    self.titleEdgeInsets	= UIEdgeInsetsMake(0, -imageSize_.width, -(imageSize_.height + spaceH), 0);
    self.imageEdgeInsets	= UIEdgeInsetsMake(-(titleSize_.height + spaceH), 0, 0, -(titleSize_.width + correctX));
}

- (void)adjustsVerticalCenterWithSpaceH:(CGFloat)spaceH {
    [self adjustsVerticalCenterWithSpaceH:spaceH correctX:0.0f];
}
@end
