//
//  BaseModel.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2017. 2. 8..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

@property(strong, nonatomic) NSString *ver;
@property(strong, nonatomic) NSString *result;
@property(strong, nonatomic) NSString *message;
@property(strong, nonatomic) NSString *originalResponse;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (void)__debugLog;
- (void)__debugLogForExistValue;

@end
