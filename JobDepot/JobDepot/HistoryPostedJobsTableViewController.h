//
//  HistoryPostedJobsTableViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <CoreData/CoreData.h>


@interface HistoryPostedJobsTableViewController : UITableViewController
@property (nonatomic, strong) NSArray * postedJobs;
@end
