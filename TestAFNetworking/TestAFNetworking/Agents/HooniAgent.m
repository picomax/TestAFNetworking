//
//  HooniAgent.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "HooniAgent.h"

@implementation CalculatorAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/calculator.php";
    self.modelClass = [CalculatorModel class];
    self.networName = @"HooniNetwork";
}
@end

@implementation ListViewAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/listview.php";
    self.modelClass = [CalculatorModel class];
    self.networName = @"HooniNetwork";
}
@end
