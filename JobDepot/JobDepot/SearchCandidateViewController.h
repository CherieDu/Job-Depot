//
//  SearchCandidateViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 8/1/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCandidateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *searchAll;
@property (weak, nonatomic) IBOutlet UITextField *searchIndustry;
@property (weak, nonatomic) IBOutlet UITextField *searchExperience;
@property (weak, nonatomic) IBOutlet UITextField *searchLocation;
@property (weak, nonatomic) IBOutlet UIButton *searchAllBtn;
@property (weak, nonatomic) IBOutlet UIButton *advancedSearchBtn;

@end
