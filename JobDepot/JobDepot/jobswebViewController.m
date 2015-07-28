//
//  jobswebViewController.m
//  JobDepot
//
//  Created by teambak 2015 on 7/28/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

//
//  jobsWebViewController.m
//  JobDepot
//
//  Created by teambak 2015 on 7/28/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "jobswebViewController.h"

@interface jobswebViewController ()

@end

@implementation jobswebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    searchTableViewController *stc;
    NSMutableArray *depotsURL;
    
    depotsURL = [[NSMutableArray alloc] initWithCapacity:40];
    CBSearchObject *so = [[CBSearchObject alloc] init];
    
    SearchViewController *svc;
    CBJob *tmpJob;
    PFObject *resultjob = [PFObject objectWithClassName:@"ResultJobs"];
    
    
    NSString *jobt = svc.jobtitleTextField.text;
    NSString *jobl = svc.joblocTextField.text;
    
    depotsURL = [[NSMutableArray alloc] initWithCapacity:40];
    
    
    CBJobSearchResult *searchResult = [CBJobSearch jobsFromAPIWithSearchObject:[CBSearchObject searchObjectWithKeywords:jobt AndLocation:jobl]];
    
    NSLog(@"Search Results: count=%i and numJobs = %i and xx=%i", searchResult.totalCount, searchResult.results.count, [searchResult countOfResults]);
    
    //    for(tmpJob in searchResult.results)
    //
    //    {
    //
    //        //        NSLog(@"job title: %@", tmpJob.jobTitle);
    //        //        NSLog(@"Company: %@", tmpJob.company);
    //        //        NSLog(@"CompanyImageURL: %@", tmpJob.companyImageURL);
    //                NSLog(@"job URL: %@", tmpJob.jobDetailsURL);
    //
    //        //      NSArray *search = tmpJob.jobTitle;
    //
    //        //      jobs = [[NSArray alloc]initWithObjects:tmpJob.jobTitle, nil];
    //
    //        //        CBJob *test = [[CBJob alloc] init];
    //
    //        //        test.jobTitle = jobtitles;
    //
    //
    //        [depotsURL addObject:tmpJob.jobDetailsURL];
    //
    //
    ////        NSString* ucp =[(NSString *)tmpJob.jobDetailsURL lowercaseString];
    ////        NSURL *url = [NSURL URLWithString:ucp];
    ////        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    //
    //
    ////        NSString *url = depotsURL[1];
    //
    //
    //
    //
    //
    ////    [_webView loadRequest:url];
    //
    //
    //}
    for(tmpJob in searchResult.results)
    {
        NSString *url = [NSString stringWithFormat:@"%@", tmpJob.jobDetailsURL];
        NSLog(@"this is url %@", url);
        NSURL *myURL = [NSURL URLWithString:url];
        NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
        [_webView loadRequest:request];
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

@end

