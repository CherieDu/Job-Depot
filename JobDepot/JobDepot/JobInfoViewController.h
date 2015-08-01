//
//  JobInfoViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/31/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobInfoViewController : UIViewController
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *jobTitle;

@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UITextView *jobDescription;
@property (weak, nonatomic) IBOutlet UILabel *jobAddress;

@property (weak, nonatomic) IBOutlet UILabel *jobType;

@property (weak, nonatomic) IBOutlet UILabel *startDate;

@end
