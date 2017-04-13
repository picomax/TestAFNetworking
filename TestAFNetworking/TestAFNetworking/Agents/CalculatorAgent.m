//
//  CalculatorAgent.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "CalculatorAgent.h"

@implementation CalculatorAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/calculator.php";
    self.modelClass = [CalculatorModel class];
    self.networName = @"HooniNetwork";
}
@end
