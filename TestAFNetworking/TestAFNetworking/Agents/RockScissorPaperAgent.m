//
//  RockScissorPaperAgent.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "RockScissorPaperAgent.h"

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

