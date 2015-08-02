//
//  CandidateSearchResultTableViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 8/2/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "CandidateSearchResultTableViewController.h"
#import "CandidateInfoViewController.h"
@interface CandidateSearchResultTableViewController ()

@end

@implementation CandidateSearchResultTableViewController
@synthesize candidateList;

//-(void)setCandidateList:(NSArray *)candidateList{
//    _candidateList = candidateList;
//    [self.tableView reloadData];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchCandidateInfo];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void) fetchCandidateInfo
{
    NSLog(@"CandidateSearchResultTableViewController candidate fetchCandidateInfo %@", self.candidateList);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.candidateList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Candidate Cell" forIndexPath:indexPath];
    
    NSDictionary *candidate = self.candidateList[indexPath.row];
    cell.textLabel.text = [candidate valueForKey:@"formattedName"];
    cell.detailTextLabel.text = [candidate valueForKey:@"headline"];
    NSLog(@"SearchCandidateResultTableViewController%@", candidate);

    
    
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

- (NSDictionary *)fetchedResultsController: (CandidateInfoViewController *)candidateInfoVC toDisplayInfo:(NSDictionary *)candidate

{
    
    NSLog(@"candidatecandidatecandidate%@", candidate);
    
    
    
    return candidate;
    
}

- (void)prepareCandidateInfoViewController:(CandidateInfoViewController *)candidateInfoVC toDisplayInfo:(NSDictionary *)candidate

{
    
    NSLog(@"prepareJobInfoViewController %@", candidate);
    
    candidateInfoVC.title = [candidate valueForKey:@"formattedName"];
    
    candidateInfoVC.name.text = [candidate valueForKey:@"formattedName"];
    
    candidateInfoVC.email.text = [candidate valueForKey:@"emailAddress"];
    
    candidateInfoVC.headline.text = [candidate valueForKey:@"headline"];
    candidateInfoVC.industry.text = [candidate valueForKey:@"industry"];

    
    candidateInfoVC.workTitle.text = [candidate valueForKey:@"positionTitle"];
    candidateInfoVC.workCompany.text = [candidate valueForKey:@"positionCompany"];
    candidateInfoVC.workExperience.text = @"Work Experience:";
    candidateInfoVC.headline.text = [candidate valueForKey:@"headline"];
    
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
            if ([segue.identifier isEqualToString:@"Display Candidate Info"]) {
                NSLog(@"Segue:Display Candidate Info");
                
                if ([segue.destinationViewController isKindOfClass:[CandidateInfoViewController class]]) {
                    
                    //                    [self prepareJobInfoViewController:segue.destinationViewController toDisplayInfo:self.postedJobs[indexPath.row]];
                    
                    
                    //                    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                    NSDictionary *object = [self fetchedResultsController: segue.destinationViewController toDisplayInfo:self.candidateList[indexPath.row]];
                    

                    
                    //
                    //
                    //
                    ////                    [[self fetchedResultsController] objectAtIndexPath:indexPath];
                    [[segue destinationViewController] setDetailCandidate:object];
                    //
                    
                    
                    
                    //                    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
                    
                    
                    //                    NSDictionary *jobs = [[self fetchJobs]]
                    //                    NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
                    //                    [[segue destinationViewController] setDetailItem:object];
                    
                    
                }
            }
        }
    }

    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
