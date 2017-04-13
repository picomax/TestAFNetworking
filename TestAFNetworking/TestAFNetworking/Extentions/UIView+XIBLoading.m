//
//  UIView+XIBLoading.m
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "UIView+XIBLoading.h"

@implementation UIView (XIBLoading)

+ (id)loadFromNib {
    return [self loadWithNibName:NSStringFromClass(self) owner:nil options:nil];
}

+ (id)loadWithNibName:(NSString *)nibName {
    return [self loadWithNibName:nibName owner:nil options:nil];
}

+ (id)loadWithNibName:(NSString *)nibName owner:(id)owner {
    return [self loadWithNibName:nibName owner:owner options:nil];
}

+ (id)loadWithNibName:(NSString *)nibName owner:(id)owner options:(NSDictionary *)options {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:options];
    for (id obj in array) {
        if ([obj isKindOfClass:self]) {
            return obj;
        }
    }
    return nil;
}

@end
