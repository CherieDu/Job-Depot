//
//  CandidateInfoViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 8/2/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CandidateInfoViewController : UIViewController
@property (strong, nonatomic) id detailCandidate;
//@property (weak, nonatomic) IBOutlet UILabel *name;
//@property (weak, nonatomic) IBOutlet UITextView *headline;
//@property (weak, nonatomic) IBOutlet UILabel *email;
//@property (weak, nonatomic) IBOutlet UILabel *city;
//@property (weak, nonatomic) IBOutlet UILabel *country;
//@property (weak, nonatomic) IBOutlet UILabel *industry;
//@property (weak, nonatomic) IBOutlet UILabel *workExperience;
//@property (weak, nonatomic) IBOutlet UILabel *workTitle;
//@property (weak, nonatomic) IBOutlet UILabel *workCompany;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UITextView *headline;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *city;

@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *industry;
@property (weak, nonatomic) IBOutlet UILabel *workExperience;
@property (weak, nonatomic) IBOutlet UILabel *workTitle;
@property (weak, nonatomic) IBOutlet UILabel *workCompany;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@end
