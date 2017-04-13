//
//  OpenURLParser.m
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "OpenURLParser.h"

@interface OpenURLParser ()
@end

@implementation ParsedModel
- (NSString *)valueForKey:(NSString *)keyString {
    return [_queryItems objectForKey:keyString];
}

- (BOOL)hasKey:(NSString *)keyString {
    /*
    BOOL *result;
    *result = NO;
    [_queryItems enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
        *result = ([key isEqualToString:keyString] == YES);
        *stop = result;
    }];
    */
    for(NSString *key in _queryItems){
        if([keyString isEqualToString:key] == YES){
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)hasValue:(NSString *)valueString {
    for(NSString *key in _queryItems){
        NSString *value = [_queryItems objectForKey:key];
        if([valueString isEqualToString:value] == YES){
            return YES;
        }
    }
    return NO;
}
@end

@implementation OpenURLParser

+(ParsedModel *)parsingUrlString:(NSString *)urlString {
    return [OpenURLParser parsingUrl:[NSURL URLWithString:urlString]];
}

+(ParsedModel *)parsingUrl:(NSURL *)url {
    ParsedModel *parsedModel = [[ParsedModel alloc] init];
    
    parsedModel.urlString = url.absoluteString;
    parsedModel.schemeName = [url scheme];
    parsedModel.hostName = [url host];
    parsedModel.portNumber = [url port];
    parsedModel.pathName = [url path];
    parsedModel.pathComponents = [url pathComponents];
    parsedModel.paramString = [url parameterString];
    parsedModel.queryString = [url query];
    parsedModel.fragmentString = [url fragment];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    NSArray *queryItems = [components queryItems];
    //NSMutableDictionary *dict = [NSMutableDictionary new];
    parsedModel.queryItems = [NSMutableDictionary new];
    for (NSURLQueryItem *item in queryItems) {
        [parsedModel.queryItems setObject:[item value] forKey:[item name]];
    }
    
    NSLog(@"----------------------------------------");
    NSLog(@"url: %@", [url absoluteString]);
    NSLog(@"scheme: %@", [url scheme]);
    NSLog(@"host: %@", [url host]);
    NSLog(@"port: %@", [url port]);
    NSLog(@"path: %@", [url path]);
    NSLog(@"path components: %@", [url pathComponents]);
    NSLog(@"parameterString: %@", [url parameterString]);
    NSLog(@"query: %@", [url query]);
    NSLog(@"fragment: %@", [url fragment]);
    NSLog(@"----------------------------------------");
    /*
     scheme: ProjectOksusu
     host: oksusu.skplanet.com
     port: 8080
     path: /12345
     path components: (
     "/",
     12345
     )
     parameterString: params
     query: abc=123&def=456&ghi=789
     fragment: fragment
     */
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    NSLog(@"----------------------------------------");
    for (NSURLQueryItem *item in queryItems)
    {
        [dict setObject:[item value] forKey:[item name]];
        NSLog(@"queryItems : %@ = %@", [item name], [item value]);
    }
    NSLog(@"----------------------------------------");
    /*
     queryItems : abc = 123
     queryItems : def = 456
     queryItems : ghi = 789
     */
    
    return parsedModel;
}

@end
