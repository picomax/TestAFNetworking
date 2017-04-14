//
//  TestAFNetworkingTests.m
//  TestAFNetworkingTests
//
//  Created by hooni on 2017. 4. 13..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Util.h"
#import "Agents.h"

@interface TestAFNetworkingTests : XCTestCase
@property(nonatomic, assign) BOOL bTestComplete;
@property(nonatomic, assign) BOOL bSetupComplete;
@end

@implementation TestAFNetworkingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testCalculatorAgent {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"0.1" forKey:@"ver"];
    [params setObject:@"json" forKey:@"response_format"];
    [params setObject:@"12" forKey:@"number1"];
    [params setObject:@"23" forKey:@"number2"];
    [params setObject:@"plus" forKey:@"optype"];
    [params setObject:@"ios" forKey:@"osinfo"];
    
    [CalculatorAgent getDataWithParameters:params
                                        block:^(CalculatorModel *model) {
                                            // NSLog(@"%@", model);
                                            if(model == nil){
                                                XCTFail(@"failed");
                                                _bTestComplete = YES;
                                            }
                                            
                                            if(model.result == nil) {
                                                XCTFail(@"failed");
                                                _bTestComplete = YES;
                                            }
                                            
                                            if([[model.result lowercaseString] isEqualToString:@"ok"] == YES) {
                                                //NSLog(@"result = %@", model);
                                                NSLog(@"score : %@", model.score);
                                                _bTestComplete = YES;
                                                return;
                                            }else{
                                                //NSLog(@"error = %@", model.error);
                                                NSLog(@"error : %@", model.message);
                                            }
                                            
                                            XCTFail(@"failed");
                                            _bTestComplete = YES;
                                        }];
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    while (!_bTestComplete && [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]])
        ;
}

@end
