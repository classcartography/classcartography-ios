//
//  WebViewController.m
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import "WebViewController.h"
#import "InBloomAPIHandler.h"
#import "SBJson.h"


@implementation WebViewController

- (id)init {
    if (self = [super init]) { }
    
    return self;
}


#pragma mark -
#pragma mark View lifecycle

- (void)loadView {
    [super loadView];
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = self.view.frame;
    frame.size.height = self.view.frame.size.height-64;
    _webview = [[UIWebView alloc] init];
    _webview.frame = self.view.frame;
    _webview.backgroundColor = [UIColor clearColor];
    _webview.delegate = self;

    [self.view addSubview:_webview];
}


#pragma mark -
#pragma mark public methods

- (void)loadRequest:(NSString *)url {
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}


#pragma mark -
#pragma mark UIWebViewDelegate methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView { }

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *responseString = [webView stringByEvaluatingJavaScriptFromString: @"document.body.innerText"];
    NSRange isRange = [responseString rangeOfString:@"{\"authorization_code" options:NSCaseInsensitiveSearch];
    if(isRange.location == 0) {
        SBJsonParser *json = [[SBJsonParser alloc] init];
        NSDictionary *d = [json objectWithString:responseString];
        
        [[InBloomAPIHandler sharedInBloomAPIHandler] saveSession:[d objectForKey:@"authorization_code"]];
        [self dismissViewControllerAnimated:YES completion:nil];
    } 
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error { }

@end
