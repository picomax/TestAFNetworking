//
//  OpenURLParser.h
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParsedModel : NSObject
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSString *schemeName;
@property (strong, nonatomic) NSString *hostName;
@property (strong, nonatomic) NSNumber *portNumber;
@property (strong, nonatomic) NSString *pathName;
@property (strong, nonatomic) NSArray *pathComponents;
@property (strong, nonatomic) NSString *paramString;
@property (strong, nonatomic) NSString *queryString;
@property (strong, nonatomic) NSString *fragmentString;
@property (strong, nonatomic) NSMutableDictionary *queryItems;

- (NSString *)valueForKey:(NSString *)keyString;
- (BOOL)hasKey:(NSString *)keyString;
- (BOOL)hasValue:(NSString *)valueString;
@end

@interface OpenURLParser : NSObject
+(ParsedModel *)parsingUrlString:(NSString *)urlString;
+(ParsedModel *)parsingUrl:(NSURL *)url;
@end
