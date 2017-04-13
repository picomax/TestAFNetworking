//
//  BaseViewController.h
//  TestAFNetworking
//
//  Created by picomax on 2017. 4. 14..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)hideKeyboard;
- (void)logRequestData:(NSMutableDictionary *)dictionary target:(UITextView *)textView;
- (void)logResponseData:(NSDictionary *)dictionary target:(UITextView *)textView;
@end
