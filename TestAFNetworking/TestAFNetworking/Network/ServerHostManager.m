//
//  ServerHostManager.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "ServerHostManager.h"
#import "SingletonMacro.h"

NSString *const DevCrashLoggerApiKey = @"1234567890";
NSString *const StgCrashLoggerApiKey = @"1234567890";
NSString *const PrdCrashLoggerApiKey = @"1234567890";

NSString *const DevHooniHostUrlString = @"https://hooni.net";
NSString *const StgHooniHostUrlString = @"https://hooni.net";
NSString *const PrdHooniHostUrlString = @"https://hooni.net";

NSString *const DevNzeenHostUrlString = @"https://nzeen.com";
NSString *const StgNzeenHostUrlString = @"https://nzeen.com";
NSString *const PrdNzeenHostUrlString = @"https://nzeen.com";

@implementation ServerHostManager
#pragma mark - Override
SYNTHESIZE_SINGLETON_CLASS(ServerHostManager, sharedInstance)

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
#ifdef DEBUG
    [self initServerType];
#endif
    return self;
}

#ifdef DEBUG
- (void)initServerType {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([[[prefs dictionaryRepresentation] allKeys] containsObject:ServerInfoUserDefaultsKey] == YES) {
        NSString *serverInfo = [[NSUserDefaults standardUserDefaults] stringForKey:ServerInfoUserDefaultsKey];
        if([serverInfo isEqualToString:DevNetworkUserDefaultsKey] == YES){
            self.serverType = DevNetwork;
        }else if([serverInfo isEqualToString:StgNetworkUserDefaultsKey] == YES){
            self.serverType = StgNetwork;
        }else if([serverInfo isEqualToString:PrdNetworkUserDefaultsKey] == YES){
            self.serverType = PrdNetwork;
        }
    } else {
        self.serverType = PrdNetwork;
        [[NSUserDefaults standardUserDefaults] setObject:PrdNetworkUserDefaultsKey forKey:ServerInfoUserDefaultsKey];
        //[[NSUserDefaults standardUserDefaults] setObject:DevNetworkUserDefaultsKey forKey:ServerInfoUserDefaultsKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self initServerType];
    }
}
#endif

- (NSString *)apiKeyForCrashLogger {
    NSString *apiKey = PrdCrashLoggerApiKey;
#ifdef DEBUG
    switch (_serverType) {
        case DevNetwork:
            return DevCrashLoggerApiKey;
            break;
        case StgNetwork:
            return StgCrashLoggerApiKey;
            break;
        case PrdNetwork:
            return PrdCrashLoggerApiKey;
            break;
        default:
            break;
    }
#endif
    return apiKey;
}

- (NSString *)hostUrlForHooni {
    NSString *hostUrl = PrdHooniHostUrlString;
#ifdef DEBUG
    switch (_serverType) {
        case DevNetwork:
            return PrdHooniHostUrlString;
            break;
        case StgNetwork:
            return StgHooniHostUrlString;
            break;
        case PrdNetwork:
            return PrdHooniHostUrlString;
            break;
        default:
            break;
    }
#endif
    return hostUrl;
}

- (NSString *)hostUrlForNzeen {
    NSString *hostUrl = PrdNzeenHostUrlString;
#ifdef DEBUG
    switch (_serverType) {
        case DevNetwork:
            return DevHooniHostUrlString;
            break;
        case StgNetwork:
            return StgHooniHostUrlString;
            break;
        case PrdNetwork:
            return PrdHooniHostUrlString;
            break;
        default:
            break;
    }
#endif
    return hostUrl;
}

@end
