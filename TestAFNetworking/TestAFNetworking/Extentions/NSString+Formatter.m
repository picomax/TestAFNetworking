//
//  NSString+Formatter.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "NSString+Formatter.h"

NSString * const MONETARY_UNIT_SYMBOL_WON = @"￦";

@implementation NSString (Formatter)

+ (NSString *)formatSizeForOksusu:(NSString *)sizeString {
    if (sizeString.length == 0) {
        return @"";
    }
    
    // use regex to remove non-digits(including spaces) so we are left with just the numbers
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\s-\\(\\)]"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    sizeString = [regex stringByReplacingMatchesInString:sizeString
                                                   options:0
                                                     range:NSMakeRange(0, [sizeString length])
                                              withTemplate:@""];
    
    // check if the number is to long
    if (sizeString.length > 10) {
        // remove last extra chars.
        sizeString = [sizeString substringToIndex:10];
    }
    
    // 123 456 7890
    // format the number.. if it's less then 7 digits.. then use this regex.
    if (sizeString.length < 5) {
        sizeString = [sizeString stringByReplacingOccurrencesOfString:@"(\\d{2})(\\d+)"
                                                               withString:@"$1,$2"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [sizeString length])];
    } else {
        // else do this one..
        sizeString = [sizeString stringByReplacingOccurrencesOfString:@"(\\d{2})(\\d{2})(\\d+)"
                                                               withString:@"$1,$2,$3"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [sizeString length])];
    }
    return sizeString;
}

+ (NSString *)numberFormatWithComma:(NSInteger)value {
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    NSString *numberStr =
            [NSString stringWithFormat:@"%@%@", MONETARY_UNIT_SYMBOL_WON, [numFormatter stringFromNumber:[NSNumber numberWithInteger:value]]];

    return numberStr;
}

+ (NSString *)numberFormatWithCommaJustNumber:(NSInteger)value {
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString *numberStr =
    [NSString stringWithFormat:@"%@", [numFormatter stringFromNumber:[NSNumber numberWithInteger:value]]];
    
    return numberStr;
}

+ (NSString *)numberFormatWithCommaWon:(NSInteger)value {
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSString *numberStr =
    [NSString stringWithFormat:@"￦%@", [numFormatter stringFromNumber:[NSNumber numberWithInteger:value]]];
    
    return numberStr;
}

+ (NSString *)capitalizedWord:(NSString *)plainString {
    NSString *capitalisedString =
            [plainString stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                 withString:[[plainString substringToIndex:1] capitalizedString]];
    return capitalisedString;
}

+ (NSString *)formatPhoneNumber:(NSString *)simpleNumber deleteLastChar:(BOOL)deleteLastChar {
    if (simpleNumber.length == 0) {
        return @"";
    }

    // use regex to remove non-digits(including spaces) so we are left with just the numbers
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\s-\\(\\)]"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    simpleNumber = [regex stringByReplacingMatchesInString:simpleNumber
                                                   options:0
                                                     range:NSMakeRange(0, [simpleNumber length])
                                              withTemplate:@""];

    // check if the number is to long
    if (simpleNumber.length > 10) {
        // remove last extra chars.
        simpleNumber = [simpleNumber substringToIndex:10];
    }

    if (deleteLastChar) {
        // should we delete the last digit?
        simpleNumber = [simpleNumber substringToIndex:[simpleNumber length] - 1];
    }

    // 123 456 7890
    // format the number.. if it's less then 7 digits.. then use this regex.
    if (simpleNumber.length < 7) {
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d+)"
                                                               withString:@"($1) $2"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    } else {
        // else do this one..
        simpleNumber = [simpleNumber stringByReplacingOccurrencesOfString:@"(\\d{3})(\\d{3})(\\d+)"
                                                               withString:@"($1) $2-$3"
                                                                  options:NSRegularExpressionSearch
                                                                    range:NSMakeRange(0, [simpleNumber length])];
    }
    return simpleNumber;
}

- (BOOL)isPhoneNumberString {
    return ([self length] > 13);
}

- (BOOL)isEmailString {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (CGFloat) heightWithWidth:(CGFloat)width font:(UIFont*)font {
    CGSize constraint = CGSizeMake(width, 20000.0f);
    CGSize size;
    
    CGSize boundingBox = [self boundingRectWithSize:constraint
                                                               options:NSStringDrawingUsesLineFragmentOrigin
                                                            attributes:@{NSFontAttributeName:font}
                                                               context:nil].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    return size.height;
}

- (BOOL) isAllDigits
{
    NSCharacterSet* nonNumbers = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSRange r = [self rangeOfCharacterFromSet: nonNumbers];
    return r.location == NSNotFound;
}

+ (NSString*) yyyymmddWithDot:(NSString*)fullDateStr {
    NSMutableString * resultStr = [NSMutableString new];
    
    for (int i = 0; i < fullDateStr.length; i++) {
        NSString * charStr = [fullDateStr substringWithRange:NSMakeRange(i, 1)];
         if ([charStr isAllDigits])
             [resultStr appendString:charStr];
        if (resultStr.length == 4)
            [resultStr appendString:@"."];
        else if (resultStr.length == 7)
            [resultStr appendString:@"."];
        if (resultStr.length == 10)
            break;
    }
    
    
    return resultStr;
}
@end
