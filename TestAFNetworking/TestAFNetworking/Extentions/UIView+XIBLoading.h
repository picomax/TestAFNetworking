//
//  UIView+XIBLoading.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (XIBLoading)

+ (id)loadFromNib;
+ (id)loadWithNibName:(NSString *)nibName;
+ (id)loadWithNibName:(NSString *)nibName owner:(id)owner;
+ (id)loadWithNibName:(NSString *)nibName owner:(id)owner options:(NSDictionary *)options;

@end
