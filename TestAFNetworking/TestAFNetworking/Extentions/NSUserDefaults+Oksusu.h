//
//  NSUserDefaults+Oksusu.h
//  TestAFNetworkingHooni
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Oksusu)
- (void)saveCustomObject:(id<NSCoding>)object forKey:(NSString *)key;
- (id<NSCoding>)loadCustomObjectForKey:(NSString *)key;
@end
