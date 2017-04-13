//
//  NetworkManager.h
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface HooniNetwork : AFHTTPSessionManager
+ (instancetype)sharedInstanceWithType:(NSString *)type;
@end

@interface NzeenNetwork : AFHTTPSessionManager
+ (instancetype)sharedInstanceWithType:(NSString *)type;
@end
