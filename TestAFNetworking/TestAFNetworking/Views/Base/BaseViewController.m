//
//  BaseViewController.m
//  TestAFNetworking
//
//  Created by picomax on 2017. 4. 14..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void)logRequestData:(NSMutableDictionary *)dictionary target:(UITextView *)textView {
    if(dictionary == nil){
        [textView setText:@"N/A"];
        return;
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        [textView setText:[NSString stringWithFormat:@"%@", error]];
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        [textView setText:jsonString];
    }
}

- (void)logResponseData:(NSDictionary *)dictionary target:(UITextView *)textView {
    if(dictionary == nil){
        [textView setText:@"N/A"];
        return;
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        [textView setText:[NSString stringWithFormat:@"%@", error]];
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        [textView setText:jsonString];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
