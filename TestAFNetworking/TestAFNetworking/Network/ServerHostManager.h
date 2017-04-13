//
//  ServerHostManager.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    DevNetwork = 0,
    StgNetwork = 1,
    PrdNetwork = 2
} ServerType;

@interface ServerHostManager : NSObject
@property(assign, nonatomic) ServerType serverType;
+ (instancetype)sharedInstance;
- (NSString *)apiKeyForCrashLogger;
- (NSString *)hostUrlForHooni;
- (NSString *)hostUrlForNzeen;
@end
