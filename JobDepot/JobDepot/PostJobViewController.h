//
//  PostJobViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/28/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostJobViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *jobTitle;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UITextView *jobDescription;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *country;


- (IBAction)PostJobBtnAction:(id)sender;

@end
