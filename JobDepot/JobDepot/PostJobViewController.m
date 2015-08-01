//
//  PostJobViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/28/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "PostJobViewController.h"

@interface PostJobViewController ()

@end

@implementation PostJobViewController
@synthesize jobTitle, company, jobDescription, city, country, address;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    
    
    if (![PFUser currentUser]) { // No user logged in
        
        MyLoginViewController *logInViewController = [[MyLoginViewController alloc] init];
        //        logInViewController.signUpController = [[MySignUpViewController alloc] init];
        
        
        
        // Create the log in view controller
        //
        //        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        
        
        
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        
        // Create the sign up view controller
        
        MySignUpViewController *signUpViewController = [[MySignUpViewController alloc] init];
        
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        
        // Assign our sign up controller to be displayed from the login controller
        
        [logInViewController setSignUpController:signUpViewController];
        
        logInViewController.fields = (PFLogInFieldsUsernameAndPassword
                                      
                                      | PFLogInFieldsLogInButton
                                      
                                      | PFLogInFieldsSignUpButton
                                      
                                      | PFLogInFieldsPasswordForgotten);
        
        // Present the log in view controller
        
        [self presentViewController:logInViewController animated:YES completion:NULL];
        
        
        
    }
    
}



// Sent to the delegate to determine whether the log in request should be submitted to the server.

- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    
    // Check if both fields are completed
    
    if (username && password && username.length != 0 && password.length != 0) {
        
        return YES; // Begin login process
        
    }
    
    
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
      
                                message:@"Make sure you fill out all of the information!"
      
                               delegate:nil
      
                      cancelButtonTitle:@"ok"
      
                      otherButtonTitles:nil] show];
    
    return NO; // Interrupt login process
    
}



// Sent to the delegate when a PFUser is logged in.

- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}



// Sent to the delegate when the log in attempt fails.

- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    
    NSLog(@"Failed to log in...");
    
}



// Sent to the delegate when the log in screen is dismissed.

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}





// Sent to the delegate to determine whether the sign up request should be submitted to the server.

- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    
    BOOL informationComplete = YES;
    
    
    
    // loop through all of the submitted data
    
    for (id key in info) {
        
        NSString *field = [info objectForKey:key];
        
        if (!field || field.length == 0) { // check completion
            
            informationComplete = NO;
            
            break;
            
        }
        
    }
    
    
    
    // Display an alert if a field wasn't completed
    
    if (!informationComplete) {
        
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
          
                                    message:@"Make sure you fill out all of the information!"
          
                                   delegate:nil
          
                          cancelButtonTitle:@"ok"
          
                          otherButtonTitles:nil] show];
        
    }
    
    
    
    return informationComplete;
    
}





// Sent to the delegate when a PFUser is signed up.

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    
    [self dismissModalViewControllerAnimated:YES]; // Dismiss the PFSignUpViewController
    
}



// Sent to the delegate when the sign up attempt fails.

- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    
    NSLog(@"Failed to sign up...");
    
}



// Sent to the delegate when the sign up screen is dismissed.

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    
    NSLog(@"User dismissed the signUpViewController");
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)PostJobBtnAction:(id)sender {
    PFUser *user = [PFUser currentUser];
    
    PFObject *postedJob = [PFObject objectWithClassName:@"PostedJob"];
    postedJob[@"employerName"] = user.username;
    postedJob[@"title"] = jobTitle.text;
    postedJob[@"company"] = company.text;
    postedJob[@"description"] = jobDescription.text;
    postedJob[@"city"] = city.text;
    postedJob[@"country"] = country.text;
    postedJob[@"address"] = address.text;
    [self.view endEditing:YES];
    [postedJob saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return YES;
}

- (IBAction)cancelAction:(id)sender {
    
//    [self.event.managedObjectContext deleteObject:self.event];
//    
//    NSError *error = nil;
//    if (![self.event.managedObjectContext save:&error]) {
//        /*
//         Replace this implementation with code to handle the error appropriately.
//         
//         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
//         */
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
    
//    [self.delegate addViewController:self didAddEvent:nil];
}


@end
