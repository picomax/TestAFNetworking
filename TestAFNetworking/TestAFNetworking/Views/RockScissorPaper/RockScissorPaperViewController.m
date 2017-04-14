//
//  RockScissorPaperViewController.m
//  TestAFNetworking
//
//  Created by picomax on 2017. 4. 14..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "RockScissorPaperViewController.h"
#import "Agents.h"

typedef enum {
    SignTypeNone = 0,
    SignTypeRock,
    SignTypeScissor,
    SignTypePaper,
    SignTypeCount
} SignTypes;

@interface RockScissorPaperViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userSignTextField;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UITextView *requestTextView;
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;
@property (assign, nonatomic) SignTypes signType;
@end

@implementation RockScissorPaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Rock Scissor Paper";
}

- (void)updateUserSignTextField {
    [_messageTextField setText:@""];
    
    [_requestTextView setText:@""];
    [_responseTextView setText:@""];
    
    switch (_signType) {
        case SignTypeRock:
            [_userSignTextField setText:@"Rock"];
            break;
            
        case SignTypeScissor:
            [_userSignTextField setText:@"Scissor"];
            break;
            
        case SignTypePaper:
            [_userSignTextField setText:@"Paper"];
            break;
            
        default:
            [_userSignTextField setText:@""];
            break;
    }
    [self hideKeyboard];
}

- (void)setMessage:(NSString *)message {
    [_messageTextField setText:message];
}

- (IBAction)userSignButtonTapped:(id)sender {
    _signType = (_signType + 1) % SignTypeCount;
    [self updateUserSignTextField];
}

- (IBAction)submitButtonTapped:(id)sender {
    NSString *userSign = _userSignTextField.text;
    
    if(userSign == nil || [userSign length] < 1){
        return;
    }
    
    userSign = [userSign lowercaseString];
    
    [self hideKeyboard];
    
    __weak __typeof__(self) weakSelf = self;
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"0.1" forKey:@"ver"];
    [params setObject:@"json" forKey:@"response_format"];
    [params setObject:@"ios" forKey:@"osinfo"];
    [params setObject:userSign forKey:@"user_sign"];
    
    [self logRequestData:params target:_requestTextView];
    
    [RockScissorPaperAgent getDataWithParameters:params
                                     block:^(RockScissorPaperModel *model) {
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
                                             NSLog(@"score : %@", model.winner);
                                             NSString *messageString = [NSString stringWithFormat:@"Winner is %@, %@", model.winner, model.message];
                                             [weakSelf setMessage:messageString];
                                         }else{
                                             //NSLog(@"error = %@", model.error);
                                             NSLog(@"error : %@", model.message);
                                         }
                                     }];
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
