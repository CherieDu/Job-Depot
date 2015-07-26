//
//  searchTableViewController.h
//  JobDepot
//
//  Created by teambak 2015 on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <CareerBuilder/CBJobSeekerFramework.h>
#import "SearchViewController.h"

@interface searchTableViewController :UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *searchtables;

@end
