//
//  RockScissorPaperModel.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 28..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "RockScissorPaperModel.h"

@implementation RockScissorPaperModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"--->NEVER:[Class: %@][Key: %@][Value Class: %@]", NSStringFromClass([self class]), key,
          NSStringFromClass([value class]));
    NSLog(@"@property (strong, nonatomic) NSString *%@;", key);
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self == nil) {
        return nil;
    }
    
    return self;
}

@end
