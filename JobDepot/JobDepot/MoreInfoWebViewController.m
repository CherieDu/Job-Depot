//
//  MoreInfoWebViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/24/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "MoreInfoWebViewController.h"

@interface MoreInfoWebViewController ()

@end

@implementation MoreInfoWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _linkedInPage.scalesPageToFit = YES;
    _linkedInPage.frame=self.view.bounds;
//     Do any additional setup after loading the view.
        PFUser *user = [PFUser currentUser];
        PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
        [query whereKey:@"userName" equalTo:user.username];
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
            if (!userInfo) {
                NSLog(@"The getFirstObject request failed.");
    
            } else {
                // The find succeeded.
                NSString *fullURL = userInfo[@"publicProfileUrl"];
                NSURL *url = [NSURL URLWithString:fullURL];
                NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                [_linkedInPage loadRequest:requestObj];

                
                //          _city.text = userInfo[@"numConnections"];
                NSLog(@"Successfully open the more info url.");
            }
        }];
    
    
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
