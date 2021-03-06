//
//  HistoryPostedJobsTableViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "HistoryPostedJobsTableViewController.h"
#import "JobInfoViewController.h"
//#import "FetchPostedJobsViewController.h"


@interface HistoryPostedJobsTableViewController ()

@end

@implementation HistoryPostedJobsTableViewController


//-(void)setJobs: (NSArray *) postedJobs{
//    _postedJobs = postedJobs;
//    [self.tableView reloadData];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.postedJobs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Posted Job Cell" forIndexPath:indexPath];
    
    NSDictionary *job = self.postedJobs[indexPath.row];
    cell.textLabel.text = [job valueForKey:@"title"];
    cell.detailTextLabel.text = [job valueForKey:@"company"];
    NSLog(@"HistoryPostedJobsTableViewController%@", job);
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
- (NSDictionary *)fetchedResultsController: (JobInfoViewController *)jobInfoVC toDisplayInfo:(NSDictionary *)job
{
    NSLog(@"jobjobjob%@", job);
    
    return job;
}
- (void)prepareJobInfoViewController:(JobInfoViewController *)jobInfoVC toDisplayInfo:(NSDictionary *)job
{
    NSLog(@"prepareJobInfoViewController %@", job);
    jobInfoVC.title = [job valueForKey:@"title"];
    jobInfoVC.jobTitle.text = [job valueForKey:@"title"];
    jobInfoVC.company.text = [job valueForKey:@"company"];
    jobInfoVC.jobDescription.text = [job valueForKey:@"description"];
    jobInfoVC.jobAddress.text = [job valueForKey:@"address"];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSLog(@"prepareForSegue");

    if ([sender isKindOfClass:[UITableViewCell class]]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"Display Job"]) {
                NSLog(@"Segue:Display Job");
                
                if ([segue.destinationViewController isKindOfClass:[JobInfoViewController class]]) {
                    
//                    [self prepareJobInfoViewController:segue.destinationViewController toDisplayInfo:self.postedJobs[indexPath.row]];

                    
//                    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                    NSDictionary *object = [self fetchedResultsController: segue.destinationViewController toDisplayInfo:self.postedJobs[indexPath.row]];
//
//                    
//                    
////                    [[self fetchedResultsController] objectAtIndexPath:indexPath];
                    [[segue destinationViewController] setDetailItem:object];
//
                    

                    
//                    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                    
                    
//                    NSDictionary *jobs = [[self fetchJobs]]
//                    NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
//                    [[segue destinationViewController] setDetailItem:object];
                    
                    
                }
            }
        }
    }

}


@end
