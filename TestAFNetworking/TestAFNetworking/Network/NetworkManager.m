//
//  NetworkManager.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "NetworkManager.h"
#import "ServerHostManager.h"
#import "Util.h"

@implementation HooniNetwork
//type = json, bson, xml
+ (instancetype)sharedInstanceWithType:(NSString *)type {
    static HooniNetwork *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *hostUrl = [[ServerHostManager sharedInstance] hostUrlForHooni];
        
        sharedInstance = [[HooniNetwork alloc] initWithBaseURL:[NSURL URLWithString:hostUrl]];
        sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sharedInstance.requestSerializer = [AFJSONRequestSerializer serializer];
        //sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        if([type isEqualToString:@"json"]){
            sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        }else{
            sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        }
        
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        NSString *deviceName = [[UIDevice currentDevice] model];
        NSString *osType = @"IOS";//[[UIDevice currentDevice] systemName];
        NSString *osVersion = [[UIDevice currentDevice] systemVersion];
        //NSString *authToken = [UserAccountManager sharedInstance].authToken;
        //NSString *uuidString = [[UserAccountManager sharedInstance] getDeviceUUID];
        /*
         NSString *httpHeaderValueString = [NSString
         stringWithFormat:@"appVersion=%@; deviceName=%@; osType=%@; osVersion=%@; authToken=%@; X-Auth-Token=%@; UUID=%@",
         appVersion, deviceName, osType, osVersion, authToken, authToken, uuidString];
         */
        //added for /v1/check/forceUpdate
        NSString *xOksusuInfoString = [NSString stringWithFormat:@"%@/%@/%@/%@", osType, osVersion, deviceName, appVersion];
        [sharedInstance.requestSerializer setValue:xOksusuInfoString forHTTPHeaderField:@"X-Oksusu-Info"];
        
        [sharedInstance.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        NSString *acceptTypeString = @"application/json;charset=UTF-8";
        if([type isEqualToString:@"bson"]){
            acceptTypeString = @"application/vnd.skb.bson";
        }else if([type isEqualToString:@"xml"]){
            acceptTypeString = @"application/xml;charset=UTF-8";
        }
        [sharedInstance.requestSerializer setValue:acceptTypeString forHTTPHeaderField:@"Accept"];
        //[sharedInstance.requestSerializer setValue:httpHeaderValueString forHTTPHeaderField:@"reqHeader"];
        
        //timeout.
        sharedInstance.requestSerializer.timeoutInterval = 10.0;
    });
    
    return sharedInstance;
}
@end


@implementation NzeenNetwork
//type = json, bson, xml
+ (instancetype)sharedInstanceWithType:(NSString *)type {
    static NzeenNetwork *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *hostUrl = [[ServerHostManager sharedInstance] hostUrlForNzeen];
        
        sharedInstance = [[NzeenNetwork alloc] initWithBaseURL:[NSURL URLWithString:hostUrl]];
        sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sharedInstance.requestSerializer = [AFJSONRequestSerializer serializer];
        //sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        if([type isEqualToString:@"json"]){
            sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        }else{
            sharedInstance.responseSerializer = [AFHTTPResponseSerializer serializer];
        }
        
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
        NSString *deviceName = [[UIDevice currentDevice] model];
        NSString *osType = @"IOS";//[[UIDevice currentDevice] systemName];
        NSString *osVersion = [[UIDevice currentDevice] systemVersion];
        //NSString *authToken = [UserAccountManager sharedInstance].authToken;
        //NSString *uuidString = [[UserAccountManager sharedInstance] getDeviceUUID];
        /*
         NSString *httpHeaderValueString = [NSString
         stringWithFormat:@"appVersion=%@; deviceName=%@; osType=%@; osVersion=%@; authToken=%@; X-Auth-Token=%@; UUID=%@",
         appVersion, deviceName, osType, osVersion, authToken, authToken, uuidString];
         */
        //added for /v1/check/forceUpdate
        NSString *xOksusuInfoString = [NSString stringWithFormat:@"%@/%@/%@/%@", osType, osVersion, deviceName, appVersion];
        [sharedInstance.requestSerializer setValue:xOksusuInfoString forHTTPHeaderField:@"X-Oksusu-Info"];
        
        [sharedInstance.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        NSString *acceptTypeString = @"application/json;charset=UTF-8";
        if([type isEqualToString:@"bson"]){
            acceptTypeString = @"application/vnd.skb.bson";
        }else if([type isEqualToString:@"xml"]){
            acceptTypeString = @"application/xml;charset=UTF-8";
        }
        [sharedInstance.requestSerializer setValue:acceptTypeString forHTTPHeaderField:@"Accept"];
        //[sharedInstance.requestSerializer setValue:httpHeaderValueString forHTTPHeaderField:@"reqHeader"];
        
        //timeout.
        sharedInstance.requestSerializer.timeoutInterval = 10.0;
    });
    
    return sharedInstance;
}
@end

