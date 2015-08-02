//
//  CandidateInfoViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 8/2/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "CandidateInfoViewController.h"

@interface CandidateInfoViewController ()
- (void)configureView;

@end

@implementation CandidateInfoViewController
@synthesize name, city, country, workCompany, workTitle, workExperience, email, headline, avatar;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailCandidate:(id)newDetailItem
{
    if (_detailCandidate != newDetailItem) {
        _detailCandidate = newDetailItem;
        
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
    
    if (self.detailCandidate) {
        NSLog(@"detailCandidate%@", self.detailCandidate);
        
        self.title =[self.detailCandidate valueForKey:@"formattedName"];
        self.name.text = [self.detailCandidate valueForKey:@"formattedName"];
        self.email.text = [self.detailCandidate valueForKey:@"emailAddress"];
        self.headline.text = self.detailCandidate[@"headline"];
        self.industry.text = [self.detailCandidate valueForKey:@"industry"];
//        self.workCompany.text = [self.detailCandidate valueForKey:@"positionCompany"];
//        self.workTitle.text = [self.detailCandidate valueForKey:@"positionTitle"];
        
        
        if (self.detailCandidate[@"pictureUrls"][@"values"][0]){
            NSLog(@" test image%@", self.detailCandidate[@"pictureUrls"][@"values"][0]);
            NSURL *url = [NSURL URLWithString:self.detailCandidate[@"pictureUrls"][@"values"][0]];
            NSData *data = [NSData dataWithContentsOfURL:url];
            avatar.image = [UIImage imageWithData:data];
            
            //                CGSize size = img.size;
        }
        
        if (self.detailCandidate[@"positions"][@"_total"] == 0) {
            workExperience.text = @"";
            workTitle.text = @"";
            workCompany.text = @"";
            
        } else {
            workExperience.text = @"Work Experience:";
            
            workTitle.text = [NSString stringWithFormat:@"Title: %@", self.detailCandidate[@"positionTitle"]];
            
            workCompany.text = [NSString stringWithFormat:@"Company: %@", self.detailCandidate[@"positionCompany"]];
        }

        
        
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
