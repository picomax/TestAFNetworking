//
//  NzeenAgent.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "NzeenAgent.h"

@implementation RockScissorPaperAgent
- (void)doSetOptions {
    self.method = BaseAgentMethodPost;
    self.path = @"/api/test/rockscissorpaper.php";
    self.modelClass = [RockScissorPaperModel class];
    self.networName = @"NzeenNetwork";
}
@end
