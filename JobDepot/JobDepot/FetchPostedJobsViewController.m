//
//  FetchPostedJobsViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "FetchPostedJobsViewController.h"
#import "HistoryPostedJobsTableViewController.h"

@interface FetchPostedJobsViewController ()

@end

@implementation FetchPostedJobsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchJobs];
    // Do any additional setup after loading the view.
}

- (void) fetchJobs{
    PFUser *user = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"PostedJob"];
    [query whereKey:@"employerName" equalTo:user.username];
    self.postedJobs = [query findObjects];

    
    NSLog(@"out side of query %@", self.postedJobs);
//    self.postedJobs = nil;
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
