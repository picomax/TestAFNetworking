//
//  BaseAgent.h
//  TestAFNetworking
//
//  Created by hooni on 2017. 2. 8..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BaseAgentBlock)(id model);

typedef enum {
    BaseAgentMethodNone = 0,
    BaseAgentMethodGet = 1,
    BaseAgentMethodDelete = 2,
    BaseAgentMethodPost = 3,
    BaseAgentMethodPut = 4,
    BaseAgentMethodPostMultipart = 5,
    BaseAgentMethodDefault = BaseAgentMethodGet,
    BaseAgentMethodMax = 6
} BaseAgent2Method;

typedef enum {
    eSessionNotRequired = 0,
    eSessionRequired = 1,
    eSessionDontCare = 2,
    eSessionRequireMax = 3
} eSessionRequire;

@interface BaseAgent : NSObject

@property(strong, nonatomic) NSString *urlPrefix;
@property(assign, nonatomic) BaseAgent2Method method;
@property(strong, nonatomic) NSString *path;

@property(assign, nonatomic) eSessionRequire requiredSessionID;
@property(assign, nonatomic) BOOL requiredEncrypt;
@property(assign, nonatomic) Class modelClass;
@property(strong, nonatomic) NSString *networName;

// 오버라이딩 반드시 필요합니다.
- (void)doSetOptions;

//
//+ (void)getDataWithParameters:(NSMutableDictionary *)parameters path:(NSString *)path type:(BaseAgentContentType)contentType block:(BaseAgentBlock)block;
+ (void)getDataWithParameters:(NSMutableDictionary *)parameters path:(NSString *)path block:(BaseAgentBlock)block;
+ (void)getDataWithParameters:(NSMutableDictionary *)parameters block:(BaseAgentBlock)block;

// URL이 완성되지 않은 Checkin의 경우 apiName과 params을 같이 넘겨 받아 실행되게 함.
+ (void)getDataWithApiName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters block:(BaseAgentBlock)block;


@end
