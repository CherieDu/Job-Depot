//
//  PostJobViewController.h
//  JobDepot
//
//  Created by Chunyue Du on 7/28/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "MyLoginViewController.h"
#import "MySignUpViewController.h"
@interface PostJobViewController : UIViewController<PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>
{
    UIDatePicker *datePicker;
}
@property (weak, nonatomic) IBOutlet UITextField *jobTitle;
@property (weak, nonatomic) IBOutlet UITextField *company;
@property (weak, nonatomic) IBOutlet UITextView *jobDescription;

@property (weak, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) IBOutlet UISegmentedControl *jobType;
@property (strong, nonatomic) IBOutlet UITextField *numberOfPosition;
@property (strong, nonatomic) IBOutlet UITextField *startDate;

- (IBAction)PostJobBtnAction:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
