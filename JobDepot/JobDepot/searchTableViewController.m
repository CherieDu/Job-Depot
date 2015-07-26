//
//  searchTableViewController.m
//  JobDepot
//
//  Created by teambak 2015 on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "searchTableViewController.h"

@interface searchTableViewController ()

@end


@implementation searchTableViewController

NSMutableArray *depots;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CBSearchObject *so = [[CBSearchObject alloc] init];
    
    SearchViewController *svc;
    
    CBJob *tmpJob;
    PFObject *resultjob = [PFObject objectWithClassName:@"ResultJobs"];
    
    
    NSString *jobt = svc.jobtitleTextField.text;
    NSString *jobl = svc.joblocTextField.text;
    
    
    depots = [[NSMutableArray alloc] initWithCapacity:40];
    
    CBJobSearchResult *searchResult = [CBJobSearch jobsFromAPIWithSearchObject:[CBSearchObject searchObjectWithKeywords:jobt AndLocation:jobl]];
    
    NSLog(@"Search Results: count=%i and numJobs = %i and xx=%i", searchResult.totalCount, searchResult.results.count, [searchResult countOfResults]);
    
    for(tmpJob in searchResult.results)
        
    {
        
        //        NSLog(@"job title: %@", tmpJob.jobTitle);
        //        NSLog(@"Company: %@", tmpJob.company);
        //        NSLog(@"CompanyImageURL: %@", tmpJob.companyImageURL);
        //        NSLog(@"job URL: %@", tmpJob.jobDetailsURL);
        
        //      NSArray *search = tmpJob.jobTitle;
        
        //      jobs = [[NSArray alloc]initWithObjects:tmpJob.jobTitle, nil];
        
        //        CBJob *test = [[CBJob alloc] init];
        
        //        test.jobTitle = jobtitles;
        
        
        [depots addObject:tmpJob.jobTitle];
        
    }

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [depots count];
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *simpleTableIdentifier = @"searchcell";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    
    
    cell.textLabel.text = [depots objectAtIndex:indexPath.row];
    
    return cell;
    
}


@end
