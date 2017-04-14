//
//  Agents.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "Agents.h"

@implementation CalculatorAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/calculator.php";
    self.modelClass = [CalculatorModel class];
    self.networName = @"CalculatorNetwork";
}
@end

@implementation OpTypeListAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/optypelist.php";
    self.modelClass = [OpTypeListModel class];
    self.networName = @"CalculatorNetwork";
}
@end

@implementation RockScissorPaperAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/rockscissorpaper.php";
    self.modelClass = [RockScissorPaperModel class];
    self.networName = @"RockScissorPaperNetwork";
}
@end

@implementation UserSignListAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/usersignlist.php";
    self.modelClass = [UserSignListModel class];
    self.networName = @"RockScissorPaperNetwork";
}
@end
