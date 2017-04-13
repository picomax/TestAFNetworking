//
//  BaseModel.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 2. 8..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "BaseModel.h"
#import "objc/runtime.h"

@implementation BaseModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"-> Warning : The %@ is not found in %@ class (The value is %@)", key, NSStringFromClass([self class]),
          NSStringFromClass([value class]));
    // NSLog(@"@property (strong, nonatomic) NSString *%@;", key);
}

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    if ([dictionary isKindOfClass:[NSNull class]]) {
        return self;
    }
    if ([dictionary isEqual:[NSNull null]]) {
        return self;
    }
    if (dictionary == (id)[NSNull null]) {
        return self;
    }
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isEqual:[NSNull null]] == NO) {
            [self setValue:obj forKey:key];
        }
    }];
    
    return self;
}

#pragma mark - Debug

- (void)__debugLog {
    unsigned int outCount, i;
    
    NSLog(@"========================================%@ START", NSStringFromClass(self.class));
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName) {
            // const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            // NSString *propertyType = [NSString stringWithUTF8String:propType];
            
            NSLog(@"%@: %@", propertyName, [self valueForKey:propertyName]);
        }
    }
    NSLog(@"========================================%@ END", NSStringFromClass(self.class));
    
    free(properties);
}

- (void)__debugLogForExistValue {
    unsigned int outCount, i;
    
    NSLog(@"========================================%@ START", NSStringFromClass(self.class));
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName) {
            NSString *key_ = [NSString stringWithUTF8String:propName];
            NSString *value_ = [self valueForKey:key_];
            if (value_) {
                NSLog(@"%@: %@", key_, value_);
            }
        }
    }
    NSLog(@"========================================%@ END", NSStringFromClass(self.class));
    
    free(properties);
}

@end
