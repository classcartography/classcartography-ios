//
//  WebViewController.h
//  ClassCartography
//
//  Created by Chamara Paul on 3/4/13.
//
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController <UIWebViewDelegate> {
    
@private
    UIWebView *_webview;
}

- (void)loadRequest:(NSString *)url;

@end
