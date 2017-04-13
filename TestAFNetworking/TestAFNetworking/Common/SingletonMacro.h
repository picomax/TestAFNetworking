//
//  SingletonMacro.h
//  TestAFNetworking
//
//  Created by hooni on 2016. 7. 12..
//  Copyright © 2017년 hooni. All rights reserved.
//

#ifndef SingletonMacro_h
#define SingletonMacro_h

    #define SYNTHESIZE_SINGLETON_CLASS(aClassName, aAccessor)                               \
        SYNTHESIZE_SINGLETON_CLASS_WITH_RETURNTYPE(aClassName, aClassName *, aAccessor)

    #define SYNTHESIZE_SINGLETON_CLASS_WITH_RETURNTYPE(aClassName, aReturnType, aAccessor)  \
        static aClassName *aAccessor = nil;                                                 \
        +(aReturnType)aAccessor {                                                           \
            if (nil != aAccessor) {                                                         \
                return aAccessor;                                                           \
            }                                                                               \
            static dispatch_once_t pred = 0;                                                \
            dispatch_once(&pred, ^{                                                         \
                aAccessor = [[aClassName alloc] init];                                      \
            });                                                                             \
            return aAccessor;                                                               \
        }
#endif /* SingletonMacro_h */
