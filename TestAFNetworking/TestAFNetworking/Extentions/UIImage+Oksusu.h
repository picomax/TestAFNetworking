//
//  UIImage+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Accelerate/Accelerate.h>

@interface UIImage (Oksusu)

- (UIImage *)centerStretchableImage;
- (UIImage *)blurImageWithRadius:(CGFloat)radius;
- (UIImage *)roundedImage;
- (UIImage *)imageWithColor:(UIColor *)color RectMake:(CGRect)Cgrect;
- (UIImage *)scaledToSize:(CGSize)newSize;

@end
