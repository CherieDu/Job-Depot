//
//  AccountViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
@interface AccountViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *avatarAcount;
@property (weak, nonatomic) IBOutlet UILabel *usernameAccount;
@property (weak, nonatomic) IBOutlet UILabel *emailAccount;

@end
