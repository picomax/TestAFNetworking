//
//  UIHelper.m
//  Oksusu
//
//  Created by 1002322 on 2016. 3. 11..
//  Copyright © 2016년 SKP. All rights reserved.
//

#import "UIHelper.h"

@implementation CUINoEdgeButon

@synthesize isLeft;
- (UIEdgeInsets)alignmentRectInsets {
  UIEdgeInsets insets;
  if ([self isLeftButton]) {
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    insets = UIEdgeInsetsMake(0, 0, 0, 0);
  } else {
//    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
      self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    insets = UIEdgeInsetsMake(0, 0, 0, 0);
  }
  return insets;
}

- (BOOL)isLeftButton {

  if (self.isLeft)
    return YES;

  return NO;

  return self.frame.origin.x < (self.superview.frame.size.width / 2);
}

- (void)setEnabled:(BOOL)enabled {
  [super setEnabled:enabled];

  if (enabled) {
    [self setAlpha:1.0f];
  } else {
    [self setAlpha:0.5f];
  }
}
@end

@implementation UIHelper

+ (UIBarButtonItem *)makeNavigationButtonItemWithTarget:(id)target
                                                 action:(SEL)action
                                             normalIcon:(UIImage *)normalIcon
                                            pressedIcon:(UIImage *)pressedIcon
                                                 isLeft:(BOOL)isLeft
                                             badgeCount:(NSInteger)badgeCount {

  return [self makeButtonItemWithIcon:normalIcon
                      highlightedIcon:pressedIcon
                               isLeft:isLeft
                               target:target
                               action:action
                           badgeCount:badgeCount];
}

+ (UIBarButtonItem *)makeButtonItemWithIcon:(UIImage *)icon
                            highlightedIcon:(UIImage *)h_icon
                                     isLeft:(BOOL)isLeft
                                     target:(id)target
                                     action:(SEL)action
                                 badgeCount:(NSInteger)badgeCount {

  CUINoEdgeButon *button = [CUINoEdgeButon buttonWithType:UIButtonTypeCustom];
  button.isLeft = isLeft;
  button.frame = CGRectMake(0, 0, 40, 40);

  [button addTarget:target
                action:action
      forControlEvents:UIControlEventTouchUpInside];

    [button setImage:icon forState:UIControlStateNormal];
    [button setImage:h_icon forState:UIControlStateHighlighted];

  if (badgeCount > 0) {
    UIButton *badgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    badgeButton.frame = CGRectMake(20, 0, 20, 20);
    badgeButton.titleLabel.font = [UIFont boldSystemFontOfSize:11];
    [badgeButton setTitle:[NSString stringWithFormat:@"%ld", (long)badgeCount]
                 forState:UIControlStateNormal];
    [badgeButton setTitleColor:[UIColor redColor]
                      forState:UIControlStateNormal];
    badgeButton.userInteractionEnabled = NO;
    badgeButton.tag = 77;
      badgeButton.backgroundColor = [UIColor yellowColor];
      badgeButton.layer.cornerRadius = 10;
      badgeButton.layer.borderWidth = 1.0f;
      badgeButton.layer.borderColor = [[UIColor lightGrayColor] CGColor];

    [button addSubview:badgeButton];
  }

  UIBarButtonItem *barItem =
      [[UIBarButtonItem alloc] initWithCustomView:button];

  return barItem;
}

+(UIImage*)makeImageWithMask:(UIImage*)image maskImage:(UIImage*)maskImage
{
#if 1
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
#else
    UIImage*  imageOriginal = image;
    UIImage*  imageMask     = maskImage;
    
    CGImageRef maskRef  = [imageMask CGImage];
    CGImageRef imageRef = [imageOriginal CGImage];
    
    float w = CGImageGetWidth(maskRef);
    float h = CGImageGetHeight(maskRef);
    
    CGImageRef maskNew = CGImageMaskCreate(w,
                                           h,
                                           CGImageGetBitsPerComponent(maskRef),
                                           CGImageGetBitsPerPixel(maskRef),
                                           CGImageGetBytesPerRow(maskRef),
                                           CGImageGetDataProvider(maskRef),
                                           NULL, false);
    
    
    CGImageRef masked = CGImageCreateWithMask(imageRef, maskNew);
    CGImageRelease(maskNew);
    
    UIImage* imageWithCircle = [UIImage imageWithCGImage:masked];
    CGImageRelease(masked);
    return imageWithCircle;
#endif
}

@end
