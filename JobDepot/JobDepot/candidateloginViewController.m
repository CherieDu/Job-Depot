//
//  candidateloginViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/2/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "candidateloginViewController.h"

#import "Parse/Parse.h"

@interface candidateloginViewController ()

@end

@implementation candidateloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"SignInUp2.JPG"]]];
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    
    
    
//    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
//    self.logInView.logo = logoView; // logo can be any UIView
    

}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//
//    
//    PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
////    logInController.delegate = self;
//    [self presentViewController:logInController animated:YES completion:nil];
//    
//    logInController.fields = (PFLogInFieldsUsernameAndPassword
//                              | PFLogInFieldsLogInButton
//                              | PFLogInFieldsSignUpButton
//                              | PFLogInFieldsPasswordForgotten
//                              | PFLogInFieldsDismissButton
//                              );
    
        
    // Do any additional setup after loading the view.
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
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















