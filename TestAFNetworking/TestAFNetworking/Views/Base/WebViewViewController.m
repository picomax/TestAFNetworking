//
//  WebViewViewController.m
//  TestAFNetworking
//
//  Created by hooni on 2017. 3. 21..
//  Copyright © 2017년 hooni. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "WebViewViewController.h"


NSString *const HostNameForKBOClub = @"https://hooni.net";

@interface WebViewViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) NSString *tCode;
@end

@implementation WebViewViewController

- (instancetype)initWithTeamCode:(NSString *)code {
    if (self = [self init]) {
        self.tCode = code;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"WKWebView";
    
    self.wkWebView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.wkWebView setNavigationDelegate:self];
    [self.view addSubview:self.wkWebView];
    
    [self loadWebView];
}

- (void)loadWebView{
    NSString *urlString = [NSString stringWithFormat:@"%@/xe/%@", HostNameForKBOClub, (_tCode == nil ? @"" : _tCode)];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.wkWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"1. didCommitNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"2. didFinishNavigation");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"3. didFailNavigation");
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
