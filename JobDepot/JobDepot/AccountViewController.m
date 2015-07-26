//
//  AccountViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "AccountViewController.h"

@interface AccountViewController ()

@end

@implementation AccountViewController
@synthesize emailAccount, avatarAcount, usernameAccount;

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    
    PFUser *user = [PFUser currentUser];
    usernameAccount.text = user.username;
    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
    [query whereKey:@"userName" equalTo:user.username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
        if (!userInfo) {
            NSLog(@"The getFirstObject request failed.");
            
            
        } else {
            // The find succeeded.
            
            emailAccount.text = userInfo[@"emailAddress"];

            
            if (userInfo[@"pictureUrls"][@"values"][0]){
                NSLog(@" test image%@", userInfo[@"pictureUrls"][@"values"][0]);
                NSURL *url = [NSURL URLWithString:userInfo[@"pictureUrls"][@"values"][0]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                avatarAcount.image = [UIImage imageWithData:data];
                
                //                CGSize size = img.size;
            }
            
            //          _city.text = userInfo[@"numConnections"];
            NSLog(@"Successfully retrieved the object???.");
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
