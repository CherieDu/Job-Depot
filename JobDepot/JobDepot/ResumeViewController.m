//
//  ResumeViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/21/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "ResumeViewController.h"
//#import "Parse/Parse.h"
#import "LinkedInHelper.h"

@interface ResumeViewController ()

@end

@implementation ResumeViewController
@synthesize email, name, headline, industry, city, country, avatar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(gotoNext:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    [self displayData];
    
    
    // Do any additional setup after loading the view.
}

-(void)uploadData:(NSDictionary*)userInfo{
    PFUser *user = [PFUser currentUser];
    PFObject *LIUserInfo = [PFObject objectWithClassName:@"LIUserInfo"];
    LIUserInfo[@"userName"] = user.username;
    LIUserInfo[@"firstName"] = [userInfo objectForKey:@"firstName"];
    LIUserInfo[@"lastName"] = [userInfo objectForKey:@"lastName"];
    LIUserInfo[@"emailAddress"] = [userInfo objectForKey:@"emailAddress"];
    LIUserInfo[@"headline"] = [userInfo objectForKey:@"headline"];
    LIUserInfo[@"formattedName"] = [userInfo objectForKey:@"formattedName"];
    LIUserInfo[@"id"] = [userInfo objectForKey:@"id"];
    LIUserInfo[@"industry"] = [userInfo objectForKey:@"industry"];
    LIUserInfo[@"location"] = [userInfo objectForKey:@"location"];
    LIUserInfo[@"pictureUrls"] = [userInfo objectForKey:@"pictureUrls"];
    
    //    LIUserInfo[@"city"] = [userInfo objectForKey:@"location" [objectForKey: @"name"]];
    //    LIUserInfo[@"country"] = [userInfo objectForKey:@"location" [objectForKey]: @"country"];
    LIUserInfo[@"publicProfileUrl"] = [userInfo objectForKey:@"publicProfileUrl"];
    //    LIUserInfo[@"lastName"] = [userInfo objectForKey:@"lastName"];
    NSLog(@"end create object");
    
    [LIUserInfo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"save success %@", userInfo);
        } else {
            NSLog(@"save data fail %@", userInfo);
                        // There was a problem, check error.description
        }
    }];

}

- (void)uploadOrUpdateData:(NSDictionary*)userInfo{
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
    [query whereKey:@"userName" equalTo:user.username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
        if (!userInfo) {
            NSLog(@"The getFirstObject request failed. start create new profile");
            PFObject *LIUserInfo = [PFObject objectWithClassName:@"LIUserInfo"];
            LIUserInfo[@"userName"] = user.username;
            LIUserInfo[@"firstName"] = [userInfo objectForKey:@"firstName"];
            LIUserInfo[@"lastName"] = [userInfo objectForKey:@"lastName"];
            LIUserInfo[@"emailAddress"] = [userInfo objectForKey:@"emailAddress"];
            LIUserInfo[@"headline"] = [userInfo objectForKey:@"headline"];
            LIUserInfo[@"formattedName"] = [userInfo objectForKey:@"formattedName"];
            LIUserInfo[@"id"] = [userInfo objectForKey:@"id"];
            LIUserInfo[@"industry"] = [userInfo objectForKey:@"industry"];
            LIUserInfo[@"location"] = [userInfo objectForKey:@"location"];
            LIUserInfo[@"pictureUrls"] = [userInfo objectForKey:@"pictureUrls"];
            
            //    LIUserInfo[@"city"] = [userInfo objectForKey:@"location" [objectForKey: @"name"]];
            //    LIUserInfo[@"country"] = [userInfo objectForKey:@"location" [objectForKey]: @"country"];
            LIUserInfo[@"publicProfileUrl"] = [userInfo objectForKey:@"publicProfileUrl"];
            //    LIUserInfo[@"lastName"] = [userInfo objectForKey:@"lastName"];
            NSLog(@"end create object");
            [LIUserInfo saveInBackground];

//            [LIUserInfo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                if (succeeded) {
//                    NSLog(@"save success %@", userInfo);
//                    //            NSLog(@"emailAddress success %@",
//                    //                  [userInfo objectForKey:@"emailAddress"]);
//                    
//                    // The object has been saved.
//                } else {
//                    NSLog(@"save data fail %@", userInfo);
//                    // There was a problem, check error.description
//                }
//            }];

            
            
        } else {
            // The find succeeded.
            
            userInfo[@"userName"] = user.username;
            userInfo[@"firstName"] = [userInfo objectForKey:@"firstName"];
            userInfo[@"lastName"] = [userInfo objectForKey:@"lastName"];
            userInfo[@"emailAddress"] = [userInfo objectForKey:@"emailAddress"];
            userInfo[@"headline"] = [userInfo objectForKey:@"headline"];
            userInfo[@"formattedName"] = [userInfo objectForKey:@"formattedName"];
            userInfo[@"id"] = [userInfo objectForKey:@"id"];
            userInfo[@"industry"] = [userInfo objectForKey:@"industry"];
            userInfo[@"location"] = [userInfo objectForKey:@"location"];
            userInfo[@"pictureUrls"] = [userInfo objectForKey:@"pictureUrls"];
            
            //    LIUserInfo[@"city"] = [userInfo objectForKey:@"location" [objectForKey: @"name"]];
            //    LIUserInfo[@"country"] = [userInfo objectForKey:@"location" [objectForKey]: @"country"];
            userInfo[@"publicProfileUrl"] = [userInfo objectForKey:@"publicProfileUrl"];
            [userInfo saveInBackground];

            
//            email.text = userInfo[@"emailAddress"];
//            name.text = userInfo[@"formattedName"];
//            headline.text = userInfo[@"headline"];
//            industry.text = userInfo[@"industry"];
//            
//            city.text = userInfo[@"location"][@"name"];
//            country.text =userInfo[@"location"][@"country"][@"code"];
//            //          _city.text = userInfo[@"numConnections"];
//            NSLog(@"Successfully retrieved the object???.");
//            NSLog(@"%@%@%@%@%@", userInfo[@"emailAddress"], userInfo[@"formattedName"], userInfo[@"headline"], userInfo[@"industry"], userInfo[@"numConnections"]);
        }
    }];
    
    
}


-(void)displayData{
    
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
    [query whereKey:@"userName" equalTo:user.username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
        if (!userInfo) {
            NSLog(@"The getFirstObject request failed.");
            
            
        } else {
            // The find succeeded.
            
            email.text = userInfo[@"emailAddress"];
            name.text = userInfo[@"formattedName"];
            headline.text = userInfo[@"headline"];
            industry.text = userInfo[@"industry"];

            city.text = userInfo[@"location"][@"name"];
            country.text =userInfo[@"location"][@"country"][@"code"];

            
            if (userInfo[@"pictureUrls"][@"values"][0]){
                NSLog(@" test image%@", userInfo[@"pictureUrls"][@"values"][0]);
                NSURL *url = [NSURL URLWithString:userInfo[@"pictureUrls"][@"values"][0]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                avatar.image = [UIImage imageWithData:data];
                
//                CGSize size = img.size;
            }
            
//          _city.text = userInfo[@"numConnections"];
            NSLog(@"Successfully retrieved the object???.");
        }
    }];
    
}

- (void)gotoNext:(id)sender{
    [self performSegueWithIdentifier:@"myView" sender:self];
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

- (IBAction)SignupLinkedInBtn:(UIButton *)sender{
    
    LinkedInHelper *linkedIn = [LinkedInHelper sharedInstance];
    
    // If user has already connected via linkedin in and access token is still valid then
    // No need to fetch authorizationCode and then accessToken again!
    
    if (linkedIn.isValidToken) {
        
        linkedIn.customSubPermissions = [NSString stringWithFormat:@"%@,%@", first_name, last_name];
        
        
        
        
        // So Fetch member info by elderyly access token
        [linkedIn autoFetchUserInfoWithSuccess:^(NSDictionary *userInfo) {
            // Whole User Info
            NSLog(@"user Info: %@", userInfo);
            [self displayData];
            
            
        } failUserInfo:^(NSError *error) {
            NSLog(@"error : %@", error.userInfo.description);
        }];
    } else {
        
        linkedIn.cancelButtonText = @"Close"; // Or any other language But Default is Close
        
        NSArray *permissions = @[@(BasicProfile),
                                 @(EmailAddress),
                                 @(Share),
                                 @(CompanyAdmin)];
        
        linkedIn.showActivityIndicator = YES;
        
        //#warning - Your LinkedIn App ClientId - ClientSecret - RedirectUrl
        
        [linkedIn requestMeWithSenderViewController:self
                                           clientId:@"77h7iqh4jv6swd"
                                       clientSecret:@"5H4XUPEEKYM6OxN8"
                                        redirectUrl:@"http://cups.cs.cmu.edu/~chunyued/mockups/templates/terms-of-use.html"
                                        permissions:permissions
                                    successUserInfo:^(NSDictionary *userInfo) {
                                        
                                        // Whole User Info
                                        NSLog(@"user Info : %@", userInfo);
                                        
                                        [self uploadData:userInfo];
                                        
                                        [self displayData];
                                        
                                        
                                        // You can also fetch user's those informations like below
                                        NSLog(@"job title : %@",     [LinkedInHelper sharedInstance].title);
                                        NSLog(@"company Name : %@",  [LinkedInHelper sharedInstance].companyName);
                                        NSLog(@"email address : %@", [LinkedInHelper sharedInstance].emailAddress);
                                        NSLog(@"Photo Url : %@",     [LinkedInHelper sharedInstance].photo);
                                        NSLog(@"Industry : %@",      [LinkedInHelper sharedInstance].industry);
                                        
                                        //                                        _email.text =[LinkedInHelper sharedInstance].emailAddress;
                                        //
                                        //
                                        
                                        
                                    }
                                  failUserInfoBlock:^(NSError *error) {
                                      NSLog(@"error : %@", error.userInfo.description);
                                  }
         ];
        
        
        
        
        
        
        
        
    }

}
//- (IBAction)moreInfoBtn:(id)sender {
////    PFUser *user = [PFUser currentUser];
////    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
////    [query whereKey:@"userName" equalTo:user.username];
////    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
////        if (!userInfo) {
////            NSLog(@"The getFirstObject request failed.");
////            
////        } else {
////            // The find succeeded.
////            
////            email.text = userInfo[@"emailAddress"];
////            name.text = userInfo[@"formattedName"];
////            headline.text = userInfo[@"headline"];
////            industry.text = userInfo[@"industry"];
////            
////            city.text = userInfo[@"location"][@"name"];
////            country.text =userInfo[@"location"][@"country"][@"code"];
////            
////            
////            if (userInfo[@"pictureUrls"][@"values"][0]){
////                NSLog(@" test image%@", userInfo[@"pictureUrls"][@"values"][0]);
////                NSURL *url = [NSURL URLWithString:userInfo[@"pictureUrls"][@"values"][0]];
////                NSData *data = [NSData dataWithContentsOfURL:url];
////                avatar.image = [UIImage imageWithData:data];
////                
////                //                CGSize size = img.size;
////            }
////            
////            //          _city.text = userInfo[@"numConnections"];
////            NSLog(@"Successfully retrieved the object???.");
////        }
////    }];
//
//}
@end
