//
//  JobInfoViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *jobTitle;

@property (strong, nonatomic) IBOutlet UILabel *company;
@property (strong, nonatomic) IBOutlet UITextView *jobDescription;
@property (strong, nonatomic) IBOutlet UILabel *jobAddress;
@property (strong, nonatomic) IBOutlet UILabel *jobCity;
@property (strong, nonatomic) IBOutlet UILabel *jobCountry;

@end
