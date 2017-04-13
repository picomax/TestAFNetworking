//
//  UILabel+Oksusu.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UILabel+Oksusu.h"

@implementation UILabel (Oksusu)

- (void) removeStrikeThrough:(NSString*)str {
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:str];
    [titleString removeAttribute:NSStrikethroughStyleAttributeName range:NSMakeRange(0, [titleString length])];
    [self setAttributedText: titleString];
}

- (void) addStrikeThrough:(NSString*)str {
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:str];
    [titleString addAttribute: NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
    [self  setAttributedText: titleString];
}

- (void) addUnderline:(NSString*)str {
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:str];
    [titleString addAttribute: NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range: NSMakeRange(0, [titleString length])];
    [self  setAttributedText: titleString];

}

- (void)adjustsHeight
{
    if (self.text.length == 0) {
        self.frameHeight = self.font.lineHeight;
        return;
    }
    
    CGFloat maxHeight_ = CGFLOAT_MAX;
    if (self.numberOfLines > 0) {
        maxHeight_ = ceilf((CGFloat)self.font.lineHeight*self.numberOfLines);
    }
    
    //self.frameHeight = ceilf([self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(self.frameWidth, maxHeight_) lineBreakMode:self.lineBreakMode].height);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:self.font.fontName size:self.font.pointSize]};
    self.frameHeight = [self.text sizeWithAttributes:attributes].height;
}

- (void)adjustsWidthWithMax:(CGFloat)max
{
    CGSize titleSize_ = CGSizeZero;
    
    if ([self respondsToSelector:@selector(attributedText)]) {
        NSAttributedString *attributedText_ = self.attributedText;
        if (attributedText_.length > 0) {
            titleSize_ = attributedText_.size;
        }
    }
    
    if (CGSizeEqualToSize(titleSize_, CGSizeZero)) {
        //titleSize_ = [self.text sizeWithFont:self.font forWidth:CGFLOAT_MAX lineBreakMode:self.lineBreakMode];
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:self.font.fontName size:self.font.pointSize]};
        self.frameHeight = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height;
    }
    
    CGFloat	maxWidth_ = ceilf((max==0.0f?CGFLOAT_MAX:max));
    
    //self.frameWidth	= ceilf([self.text sizeWithFont:self.font forWidth:maxWidth_ lineBreakMode:self.lineBreakMode].width);
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:self.font.fontName size:self.font.pointSize]};
    self.frameHeight = [self.text boundingRectWithSize:CGSizeMake(maxWidth_, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height;
}

- (void)adjustsWidth
{
    [self adjustsWidthWithMax:0.0f];
}

- (CGRect)labelTextSize
{
    CGRect labelRect = CGRectZero;
    
    labelRect = [self.text
                 boundingRectWithSize:CGSizeMake(super.frame.size.width, self.frameHeight)
                 options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:@{
                              NSFontAttributeName : self.font
                              }
                 context:nil];
    
    
    return labelRect;
    
}
- (CGFloat)labelTextHeightWithBounds:(CGSize)size
{
    CGRect labelRect = CGRectZero;
    labelRect = [self.text
                 boundingRectWithSize:size
                 options:NSStringDrawingUsesLineFragmentOrigin
                 attributes:@{
                              NSFontAttributeName : self.font
                              }
                 context:nil];
    
    return labelRect.size.height;
}

- (void)boldRange:(NSRange)range
{
    if (![self respondsToSelector:@selector(setAttributedText:)])
    {
        return;
    }
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:self.font.pointSize]} range:range];
    
    self.attributedText = attributedText;
}

- (void)boldSubstring:(NSString*)substring
{
    NSRange range = [self.text rangeOfString:substring];
    [self boldRange:range];
}

- (void)setHtmlTypeLabel:(NSString*)bodyString size:(float)size color:(NSString*)color aligment:(NSTextAlignment)aligment
{
    NSString *textAligment = @"left";
    switch (aligment) {
        case NSTextAlignmentCenter:
            textAligment = @"center";
            break;
        case NSTextAlignmentRight:
            textAligment = @"right";
            break;
        default:
            break;
    }
    NSString *headString = [NSString stringWithFormat:@"<html><head><meta charset='utf-8'/><style>body{font-size:%fpx;font-family:Apple SD gothic neo;color:%@;text-align:%@;}</style></head><body>", size, (color == nil)?@"#000000":color, textAligment];
    NSString *footString = @"</body></html>";
    
    NSString *resString = [NSString stringWithFormat:@"%@%@%@", headString, bodyString, footString];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[resString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    self.attributedText = attributedString;
    self.numberOfLines = 0;
    
}

#pragma mark - UIColor 파라미터 용
- (void)setHtmlTypeLabel:(NSString*)bodyString size:(float)size uiColor:(UIColor*)uiColor aligment:(NSTextAlignment)aligment
{
    NSString *hexColor = nil;
    if(uiColor){
        hexColor = [NSString stringWithFormat:@"#%@", [self getHexStringForColor:uiColor]];
    }
    
    [self setHtmlTypeLabel:bodyString size:size color:hexColor aligment:aligment];
}

//UIColor객체로부터 hex 값을 추출
//Unfortunately, this doesn't work with non-RGB colors like [UIColor blackColor]
- (NSString *)getHexStringForColor:(UIColor*)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
}
- (void)setPointAttributeString:(NSString*)text color:(UIColor*)color numberSize:(CGFloat)numberSize pointSize:(CGFloat)pointSize
{
    NSString *tempPoint = (text == nil)?@"0":[NSString stringWithFormat:@"%@", text];
    NSNumber *number = [NSNumber numberWithInt:[tempPoint intValue]];
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *resultString = [NSString stringWithFormat:@"%@P",[numberFormatter stringFromNumber:number]];
    
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:resultString];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, resultString.length)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:numberSize]  range:NSMakeRange(0, resultString.length-1)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Thin" size:pointSize]  range:NSMakeRange(resultString.length-1, 1)];
    
    self.attributedText = attrString;
}
- (void)setPointAttributeStringWithColor:(UIColor*)color numberSize:(CGFloat)numberSize pointSize:(CGFloat)pointSize
{
    NSString *tempPoint = self.text;
    if (tempPoint == nil) {
        return;
    }
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:tempPoint];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, tempPoint.length)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:numberSize]  range:NSMakeRange(0, tempPoint.length-1)];
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Thin" size:pointSize]  range:NSMakeRange(tempPoint.length-1, 1)];
    
    self.attributedText = attrString;
}

@end
