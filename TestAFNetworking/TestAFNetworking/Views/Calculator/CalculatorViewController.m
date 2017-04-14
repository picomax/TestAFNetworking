//
//  CalculatorViewController.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 4. 13..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Agents.h"

@interface CalculatorViewController ()
@property (weak, nonatomic) IBOutlet UITextField *number1TextField;
@property (weak, nonatomic) IBOutlet UITextField *number2TextField;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;
@property (weak, nonatomic) IBOutlet UIButton *optypeButton;
@property (weak, nonatomic) IBOutlet UITextView *requestTextView;
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Calculator";
    
    [_number1TextField becomeFirstResponder];
}

- (void)setScore:(NSString *)score {
    [_scoreTextField setText:score];
}

- (IBAction)submitButtonTapped:(id)sender {
    NSString *number1 = _number1TextField.text;
    NSString *number2 = _number2TextField.text;
    NSString *optype = @"plus";
    
    if(number1 == nil || [number1 length] < 1){
        [_number1TextField becomeFirstResponder];
        return;
    }
    
    if(number2 == nil || [number2 length] < 1){
        [_number2TextField becomeFirstResponder];
        return;
    }
    
    [self hideKeyboard];
    
    __weak __typeof__(self) weakSelf = self;
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"0.1" forKey:@"ver"];
    [params setObject:@"json" forKey:@"response_format"];
    [params setObject:number1 forKey:@"number1"];
    [params setObject:number2 forKey:@"number2"];
    [params setObject:optype forKey:@"optype"];
    [params setObject:@"ios" forKey:@"osinfo"];
    
    [self logRequestData:params target:_requestTextView];
    
    [CalculatorAgent getDataWithParameters:params
                                     block:^(CalculatorModel *model) {
                                         // NSLog(@"%@", model);
                                         if(model == nil){
                                             return;
                                         }
                                         
                                         [weakSelf logResponseData:model.originalResponse target:weakSelf.responseTextView];
                                         
                                         if(model.result == nil) {
                                             return;
                                         }
                                         
                                         if([[model.result lowercaseString] isEqualToString:@"ok"] == YES) {
                                             //NSLog(@"result = %@", model);
                                             NSLog(@"score : %@", model.score);
                                             [weakSelf setScore:model.score];
                                         }else{
                                             //NSLog(@"error = %@", model.error);
                                             NSLog(@"error : %@", model.message);
                                         }
                                     }];
}

- (IBAction)resetButtonTapped:(id)sender {
    [_number1TextField setText:@""];
    [_number2TextField setText:@""];
    [_scoreTextField setText:@""];
    
    [_requestTextView setText:@""];
    [_responseTextView setText:@""];
    
    [self hideKeyboard];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self hideKeyboard];
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
