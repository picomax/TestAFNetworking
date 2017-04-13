//
//  NetworkManager.h
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface CalculatorNetwork : AFHTTPSessionManager
+ (instancetype)sharedInstanceWithType:(NSString *)type;
@end

@interface RockScissorPaperNetwork : AFHTTPSessionManager
+ (instancetype)sharedInstanceWithType:(NSString *)type;
@end
