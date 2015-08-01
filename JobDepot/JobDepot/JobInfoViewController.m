//
//  JobInfoViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "JobInfoViewController.h"

@interface JobInfoViewController ()
- (void)configureView;

@end

@implementation JobInfoViewController
@synthesize jobTitle, jobDescription, company, jobAddress, jobCountry, jobCity;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
//    if (self.masterPopoverController != nil) {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }
}
- (void)configureView
{
    // Update the user interface for the detail item.
    
    /*
     if (self.detailItem) {
     self.detailDescriptionLabel.text = [self.detailItem description];
     }
     */
    
    if (self.detailItem) {
        NSLog(@"detailItemdetailItem%@", self.detailItem[@"description"]);

        self.title =[self.detailItem valueForKey:@"title"];
        self.jobTitle.text = [self.detailItem valueForKey:@"title"];
        self.company.text = [self.detailItem valueForKey:@"company"];
        self.jobDescription.text = self.detailItem[@"description"];
        self.jobAddress.text = [self.detailItem valueForKey:@"address"];
        self.jobCity.text = [self.detailItem valueForKey:@"city"];
        self.jobCountry.text = [self.detailItem valueForKey:@"country"];
        
    }
    
    
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
