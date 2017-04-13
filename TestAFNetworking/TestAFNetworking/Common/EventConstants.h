//
//  EventConstants.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
//접속 서버 (Dev, Prd)
extern NSString *const ServerInfoUserDefaultsKey;

extern NSString *const DevNetworkUserDefaultsKey;
extern NSString *const StgNetworkUserDefaultsKey;
extern NSString *const PrdNetworkUserDefaultsKey;
#endif

// 에러
extern NSString *const NetworkErrorPopupNotificationKey;
extern NSString *const ServerErrorPopupNotificationKey;

