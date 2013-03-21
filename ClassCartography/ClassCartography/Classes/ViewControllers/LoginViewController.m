//
//  LoginViewController.m
//  ClassCartography
//
//  Created by Paul Lee on 3/4/13.
//
//

#import "LoginViewController.h"
#import "InBloomAPIHandler.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getTest:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"class://test_page/one?token=12345&domain=foo.com"]];
}

- (IBAction)inBloomLogin:(id)sender {
    [[InBloomAPIHandler sharedInBloomAPIHandler] authenticate:self];
}

@end
