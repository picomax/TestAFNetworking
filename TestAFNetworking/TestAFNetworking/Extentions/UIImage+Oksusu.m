//
//  UIImage+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIImage+Oksusu.h"

@implementation UIImage (Oksusu)

- (UIImage *)centerStretchableImage
{
    return [self stretchableImageWithLeftCapWidth:(self.size.width/2.0f) topCapHeight:(self.size.height/2.0f)];
}

- (UIImage *)blurImageWithRadius:(CGFloat)radius
{
    if (radius < 0.0f || radius > 1.0f) {
        return self;
    }
    
    NSInteger boxSize_ = (int)(radius * 40);
    boxSize_ = boxSize_ - (boxSize_ % 2) + 1;
    
    CGDataProviderRef inProvider_ = CGImageGetDataProvider(self.CGImage);
    CFDataRef inBitmapData_ = CGDataProviderCopyData(inProvider_);
    
    vImage_Buffer inBuffer_ =
    {
        .data = (void*)CFDataGetBytePtr(inBitmapData_),
        .width = CGImageGetWidth(self.CGImage),
        .height = CGImageGetHeight(self.CGImage),
        .rowBytes =  CGImageGetBytesPerRow(self.CGImage)
    };
    
    void *pixelBuffer_ = malloc(CGImageGetBytesPerRow(self.CGImage) * CGImageGetWidth(self.CGImage) * CGImageGetHeight(self.CGImage));
    if (pixelBuffer_ == NULL) {
        free(pixelBuffer_);
        CFRelease(inBitmapData_);
        return self;
    }
    
    vImage_Buffer outBuffer_ =
    {
        .data = pixelBuffer_,
        .width = CGImageGetWidth(self.CGImage),
        .height = CGImageGetHeight(self.CGImage),
        .rowBytes = CGImageGetBytesPerRow(self.CGImage)
    };
    
    vImage_Error error_ = vImageBoxConvolve_ARGB8888(&inBuffer_, &outBuffer_, NULL, 0, 0, boxSize_, boxSize_, NULL, kvImageEdgeExtend);
    //	vImageBoxConvolve_ARGB8888(&outBuffer_, &inBuffer_, NULL, 0, 0, boxSize_, boxSize_, NULL, kvImageEdgeExtend);ㅈ
    //	vImageBoxConvolve_ARGB8888(&inBuffer_, &outBuffer_, NULL, 0, 0, boxSize_, boxSize_, NULL, kvImageEdgeExtend);
    if (error_) {
        free(pixelBuffer_);
        CFRelease(inBitmapData_);
        return self;
    }
    
    CGColorSpaceRef colorSpace_ = CGColorSpaceCreateDeviceRGB();
    CGContextRef context_ = CGBitmapContextCreate(outBuffer_.data, outBuffer_.width, outBuffer_.height, 8, outBuffer_.rowBytes, colorSpace_, (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    
    CGImageRef imageRef_ = CGBitmapContextCreateImage(context_);
    
    UIImage *blurImage_ = [UIImage imageWithCGImage:imageRef_];
    
    CGContextRelease(context_);
    CGColorSpaceRelease(colorSpace_);
    free(pixelBuffer_);
    CFRelease(inBitmapData_);
    CGImageRelease(imageRef_);
    
    return blurImage_;
}

- (UIImage *)roundedImage
{
    UIImage *image = self;
    
    //CGContextRef cx = CGBitmapContextCreate(NULL, image.size.width, image.size.height, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), CGImageGetBitmapInfo(image.CGImage));
    CGContextRef cx = CGBitmapContextCreate(NULL, image.size.width, image.size.height, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedFirst);
    
    CGContextBeginPath(cx);
    CGRect pathRect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextAddEllipseInRect(cx, pathRect);
    CGContextClosePath(cx);
    CGContextClip(cx);
    
    CGContextDrawImage(cx, CGRectMake(0, 0, image.size.width, image.size.height), image.CGImage);
    
    CGImageRef clippedImage = CGBitmapContextCreateImage(cx);
    CGContextRelease(cx);
    
    UIImage *roundedImage = [UIImage imageWithCGImage:clippedImage];
    CGImageRelease(clippedImage);
    
    return roundedImage;
}

- (UIImage *)imageWithColor:(UIColor *)color RectMake:(CGRect)Cgrect
{
    CGRect rect = Cgrect;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
