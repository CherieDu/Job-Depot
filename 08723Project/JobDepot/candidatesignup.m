//
//  candidatesignup.m
//  JobDepot
//
//  Created by teambak 2015 on 7/4/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "candidatesignup.h"
#import "Parse/Parse.h"


@interface candidatesignup()

@end

@implementation candidatesignup



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.signUpView.logo = logoView; // logo can be any UIView
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    
    //  self.signUpView.logo = logoView; // logo can be any UIView
    
    PFSignUpViewController *signUpController = [[PFSignUpViewController alloc] init];
    signUpController.delegate = self;
    [self presentViewController:signUpController animated:YES completion:nil];
    
    signUpController.fields = (PFSignUpFieldsUsernameAndPassword
                               | PFSignUpFieldsSignUpButton
                               | PFSignUpFieldsEmail
                               | PFSignUpFieldsAdditional
                               | PFSignUpFieldsDismissButton);
    
    
    // Do any additional setup after loading the view.
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    [self dismissViewControllerAnimated:YES completion:nil];
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




//@implementation candidateloginViewController : PFSignUpViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    self.view.backgroundColor = [UIColor darkGrayColor];
//
//    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
//    self.logInView.logo = logoView; // logo can be any UIView
//}
//@end















