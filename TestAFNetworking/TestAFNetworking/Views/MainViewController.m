//
//  MainViewController.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 6..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import "MainViewController.h"
#import "CalculatorViewController.h"
#import "RockScissorPaperViewController.h"
#import "WebViewViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)testCalculatorButtonTapped:(id)sender {
    CalculatorViewController *viewController = [[CalculatorViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)testRockScissorPaperButtonTapped:(id)sender {
    RockScissorPaperViewController *viewController = [[RockScissorPaperViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)testOpTypeListButtonTapped:(id)sender {
    
}

- (IBAction)testUserSignListButtonTapped:(id)sender {
    
}

- (IBAction)startWithWKWebViewButtonTapped:(id)sender {
    //WebViewViewController *viewController = [[WebViewViewController alloc] init];
    WebViewViewController *viewController = [[WebViewViewController alloc] initWithTeamCode:@"profile"];
    [self.navigationController pushViewController:viewController animated:YES];
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
