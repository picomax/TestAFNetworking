//
//  RockScissorPaperModel.h
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "BaseModel.h"

@interface RockScissorPaperModel : BaseModel

@property (nonatomic, strong) NSString *winner;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
