//
//  NSString+Formatter.h
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const MONETARY_UNIT_SYMBOL_WON;

@interface NSString (Formatter)

/**
 *  Convert to size format from general strings.
 *
 *  @param sizeString string
 *
 *  @return string after convert to size format.
 */
+ (NSString *)formatSizeForOksusu:(NSString *)sizeString;

/**
 *  Convert to numberformat.
 *
 *  @param value numberformat string.
 *
 *  @return numberformat
 */
+ (NSString *)numberFormatWithComma:(NSInteger)value;

+ (NSString *)numberFormatWithCommaJustNumber:(NSInteger)value;

/**
 *  Convert to numberformat.
 *
 *  @param value numberformat string.
 *
 *  @return numberformat
 */
+ (NSString *)numberFormatWithCommaWon:(NSInteger)value;

/**
 *  Convert to capitalized only first letter in string.
 *
 *  @param plainString string
 *
 *  @return string capitalized only first letter.
 */
+ (NSString *)capitalizedWord:(NSString *)plainString;

/**
 *  Convert to phone number format from general strings as numbers.
 *
 *  @param simpleNumber   general string
 *  @param deleteLastChar whether delete or not last character.
 *
 *  @return string after convert to phone number format.
 */
+ (NSString *)formatPhoneNumber:(NSString *)simpleNumber deleteLastChar:(BOOL)deleteLastChar;

/**
 *  Check whether phone number is 10 digit or not
 *
 *  @return boolean value by self.string
 */
- (BOOL)isPhoneNumberString;

/**
 *  Check whether e-mail format or not
 *
 *  @return boolean value by self.string
 */
- (BOOL)isEmailString;
- (CGFloat) heightWithWidth:(CGFloat)width font:(UIFont*)font;

+ (NSString*) yyyymmddWithDot:(NSString*)fullDateStr;
@end
