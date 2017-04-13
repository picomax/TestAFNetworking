//
//  UIHelper.h
//  Oksusu
//
//  Created by 1002322 on 2016. 3. 11..
//  Copyright © 2016년 SKP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CUINoEdgeButon : UIButton
@property(nonatomic, assign) BOOL isLeft;
@end

@interface UIHelper : NSObject

+ (UIBarButtonItem *)makeNavigationButtonItemWithTarget:(id)target
                                                 action:(SEL)action
                                             normalIcon:(UIImage *)normalIcon
                                            pressedIcon:(UIImage *)pressedIcon
                                                 isLeft:(BOOL)isLeft
                                             badgeCount:(NSInteger)badgeCount;

+(UIImage*)makeImageWithMask:(UIImage*)image maskImage:(UIImage*)maskImage;
@end
