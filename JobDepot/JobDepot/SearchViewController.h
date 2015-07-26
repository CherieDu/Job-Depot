//
//  SearchViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/21/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <CareerBuilder/CBJobSeekerFramework.h>
#import "MyLoginViewController.h"
#import "MySignUpViewController.h"

@interface SearchViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate,UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *jobtitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *joblocTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@end
