//
//  SearchCandidateViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 8/1/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "SearchCandidateViewController.h"
#import "CandidateSearchResultTableViewController.h"

@interface SearchCandidateViewController ()

@end

@implementation SearchCandidateViewController
@synthesize searchExperience, searchIndustry, searchLocation, searchAll;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

//- (IBAction)searchBtn:(id)sender {
//    NSString *searchString = searchAll.text;
//    PFQuery *queryheadline = [PFQuery queryWithClassName:@"LIUserInfo"];
//    [queryheadline whereKey:@"headline" containsString:searchString];
//    PFQuery *querysummary = [PFQuery queryWithClassName:@"LIUserInfo"];
//    [querysummary whereKey:@"summary" containsString:searchString];
//    
//    PFQuery *queryLocation = [PFQuery queryWithClassName:@"LIUserInfo"];
//    [queryLocation whereKey:@"city"  containsString:searchString];
//    
//    PFQuery *queryExperience = [PFQuery queryWithClassName:@"LIUserInfo"];
//    [queryExperience whereKey:@"positionTitle"  containsString:searchString];
//    PFQuery *querys = [PFQuery orQueryWithSubqueries:@[queryheadline,querysummary, queryLocation, queryExperience]];
//    self.candidateResult = [querys findObjects];
//
////    candidateSearchListTVC = [[CandidateSearchResultTableViewController alloc]init];
////
//////    candidateSearchListTVC = [[CandidateSearchResultTableViewController alloc]initWithNibName:@"CandidateSearchResultTableViewController" bundle:nil];
////
////    candidateSearchListTVC.candidateList = candidateResult;
////    [self.view addSubview:candidateSearchListTVC.view];
//    NSLog(@"Searching for %@", searchString);
//    NSLog(@"tmptmptmp%@", self.candidateResult);
//    
//    
//}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"searchAllSegue"]) {
        NSString *searchString = searchAll.text;
        PFQuery *queryheadline = [PFQuery queryWithClassName:@"LIUserInfo"];
        [queryheadline whereKey:@"headline" containsString:searchString];
        PFQuery *querysummary = [PFQuery queryWithClassName:@"LIUserInfo"];
        [querysummary whereKey:@"summary" containsString:searchString];
        
        PFQuery *queryLocation = [PFQuery queryWithClassName:@"LIUserInfo"];
        [queryLocation whereKey:@"city"  containsString:searchString];
        
        PFQuery *queryExperience = [PFQuery queryWithClassName:@"LIUserInfo"];
        [queryExperience whereKey:@"positionTitle"  containsString:searchString];
        PFQuery *querys = [PFQuery orQueryWithSubqueries:@[queryheadline,querysummary, queryLocation, queryExperience]];
        self.candidateResult = [querys findObjects];
        
        //    candidateSearchListTVC = [[CandidateSearchResultTableViewController alloc]init];
        //
        ////    candidateSearchListTVC = [[CandidateSearchResultTableViewController alloc]initWithNibName:@"CandidateSearchResultTableViewController" bundle:nil];
        //
        //    candidateSearchListTVC.candidateList = candidateResult;
        //    [self.view addSubview:candidateSearchListTVC.view];
        NSLog(@"Searching for %@", searchString);
        NSLog(@"tmptmptmp%@", self.candidateResult);
        
        
        CandidateSearchResultTableViewController *CandidateSearchResTVC= (CandidateSearchResultTableViewController *)segue.destinationViewController;
        CandidateSearchResTVC.candidateList =self.candidateResult;
    }
}


- (IBAction)advancedSearchBtn:(id)sender {
}
@end
