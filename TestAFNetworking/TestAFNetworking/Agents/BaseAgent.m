//
//  BaseAgent.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2017. 2. 8..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "BSONCodec.h"
#import "NetworkManager.h"
#import "BaseAgent.h"
#import "BaseModel.h"

@implementation BaseAgent

#pragma mark - Life cycle
typedef void (^taskSuccessBlock)(NSURLSessionTask *task, id responseObject);
typedef void (^taskFailureBlock)(NSURLSessionTask *task, NSError *error);

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    [self doSetOptions];
    
    return self;
}

#pragma mark - Override
- (void)doSetOptions {
    self.method = BaseAgentMethodDefault;
    self.path = @"";
    self.networName = @"";
    self.modelClass = [self class];
}

#pragma mark - Method
- (BOOL)isReachable {
    //return [AFNetworkReachabilityManager sharedManager].isReachable;
    return YES;
}

- (void)getDataWithParameters:(NSMutableDictionary *)parameters path:(NSString *)path block:(BaseAgentBlock)block {
    self.path = path;
    [self getDataWithParameters:parameters block:block];
}

- (void)getDataWithParameters:(NSMutableDictionary *)parameters block:(BaseAgentBlock)block {
    if (_method <= BaseAgentMethodNone || _method >= BaseAgentMethodMax || _path.length == 0) {
        NSLog(@"[%@]: Error: 1", _path);
        return;
    }
    
    // 네트웤 검증
    if ([self isReachable] == NO) {
        if (block) {
            BaseModel *dataModel = [[_modelClass alloc] initWithDictionary:[NSDictionary dictionary]];
            if (block) {
                block(dataModel);
            }
            NSLog(@"[%@]: Error: ANNE_NETWORK_NOT_REACHABLE", _path);
        }
        
        // 네트워크 팝업 호출
        [[NSNotificationCenter defaultCenter] postNotificationName:NetworkErrorPopupNotificationKey object:nil userInfo:nil];
        return;
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    if(_networName == nil || [_networName length] < 1){
        return;
    }
    
    if(NSClassFromString(_networName) == nil){
        if (block) {
            BaseModel *baseModel = [[BaseModel alloc] init];
            baseModel.message = [NSString stringWithFormat:@"Not found the %@", _networName];
            block(baseModel);
        }
        return;
    }
    
    NSString *responseFormat = [parameters objectForKey:@"response_format"]; // json, bson, xml
    AFHTTPSessionManager *networkManager = [(NSClassFromString(_networName)) sharedInstanceWithType:responseFormat];
    
    taskSuccessBlock successBlock = ^(NSURLSessionTask *task, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"[%@]: Success", self.path);
        
        NSDictionary *bodyData = ([responseFormat isEqualToString:@"bson"] == YES) ? [responseObject BSONValue] : responseObject;
        NSLog(@"JSON: %@", bodyData);
        
        BaseModel *dataModel = nil;
        NSString *className = NSStringFromClass(_modelClass);
        if ([className compare:@"BaseModel"] == 0) {
            //dataModel = [[self.modelClass alloc] initWithDictionary:[NSDictionary dictionary]];
            dataModel = [[BaseModel alloc] initWithDictionary:bodyData];
        } else {
            dataModel = [[_modelClass alloc] initWithDictionary:bodyData];
        }
        dataModel.originalResponse = bodyData;
        /*
        if ([[responseData objectForKey:@"data"] isKindOfClass:[NSNull class]]) {
            dataModel.result = [NSError errorWithDomain:@"data null" code:404 userInfo:@{@"data":@"data_null"}];
            dataModel.reason = @"";
        }
        else
            dataModel.reason = nil;
        */
        
//#warning exception!
        //TODO: 서버 에러면, 팝업 띄우기
        // [[NSNotificationCenter defaultCenter] postNotificationName:NetworkErrorPopupNotificationKey object:nil userInfo:nil];
        
        if (block) {
            block(dataModel);
        }
    };
    
    taskFailureBlock failureBlock = ^(NSURLSessionTask *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        if (block) {
            BaseModel *dataModel = [[_modelClass alloc] init];
            //dataModel.reason = error;
            
            if (operation.response == nil) {
                block(dataModel);
                NSLog(@"[%@]: Error: ANNE_NS_ERROR", self.path);
                return;
            }
            
            block(dataModel);
        }
    };
    
    NSLog(@"Parameters : %@", parameters);
    
    if (_method == BaseAgentMethodGet) {
        [networkManager GET:_path parameters:parameters progress:nil success:successBlock failure:failureBlock];
    } else if (_method == BaseAgentMethodDelete) {
        [networkManager DELETE:_path parameters:parameters success:successBlock failure:failureBlock];
    } else if (_method == BaseAgentMethodPut) {
        [networkManager PUT:_path parameters:parameters success:successBlock failure:failureBlock];
    } else if (_method == BaseAgentMethodPost) {
        [networkManager POST:_path parameters:parameters progress:nil success:successBlock failure:failureBlock];
    } else if (self.method == BaseAgentMethodPostMultipart) {
        [networkManager POST:_path
                  parameters:parameters
   constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
   }
                    progress:nil
                     success:successBlock
                     failure:failureBlock];
    }
    
    NSLog(@"[%@]: Request", _path);
}

+ (void)getDataWithParameters:(NSMutableDictionary *)parameters path:(NSString *)path block:(BaseAgentBlock)block {
    BaseAgent *baseAgent = [[self alloc] init];
    [baseAgent getDataWithParameters:parameters path:path block:block];
}

+ (void)getDataWithParameters:(NSMutableDictionary *)parameters block:(BaseAgentBlock)block {
    BaseAgent *baseAgent = [[self alloc] init];
    [baseAgent getDataWithParameters:parameters block:block];
}

// URL이 완성되지 않은 Checkin의 경우 apiName과 params을 같이 넘겨 받아 실행되게
// 함.
+ (void)getDataWithApiName:(NSString *)apiName
                parameters:(NSMutableDictionary *)parameters
                     block:(BaseAgentBlock)block {
    BaseAgent *baseAgent = [[self alloc] init];
    baseAgent.path = [NSString stringWithFormat:@"%@%@", baseAgent.urlPrefix, apiName];
    // NSMutableDictionary *reqBody = [NSMutableDictionary
    
    [baseAgent getDataWithParameters:parameters block:block];
}
#pragma mark - Override

@end
