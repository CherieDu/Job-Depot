//

//  SearchViewController.m

//  JobDepot

//

//  Created by Chunyue Du on 7/21/15.

//  Copyright (c) 2015 team4. All rights reserved.

//



#import "SearchViewController.h"



@interface SearchViewController ()



@end



@implementation SearchViewController



NSMutableArray *jobs;





- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    
    
    CBSearchObject *so = [[CBSearchObject alloc] init];
    
    CBJob *tmpJob;
    
    NSString *jobtitles;
    
    jobs = [[NSMutableArray alloc] initWithCapacity:40];
    
    CBJobSearchResult *searchResult = [CBJobSearch jobsFromAPIWithSearchObject:[CBSearchObject searchObjectWithKeywords:@"software" AndLocation:@"Pittsburgh"]];
    
    
    
    NSLog(@"Search Results: count=%i and numJobs = %i and xx=%i", searchResult.totalCount, searchResult.results.count, [searchResult countOfResults]);
    
    
    
    //    Initialize table data
    
    
    
    
    
    so.jobTitle = @"Software";
    
    so.location = @"pittsburgh";
    
    
    
    
    
    for(tmpJob in searchResult.results)
        
    {
        
        //        NSLog(@"job title: %@", tmpJob.jobTitle);
        
        //        NSLog(@"Company: %@", tmpJob.company);
        
        //        NSLog(@"CompanyImageURL: %@", tmpJob.companyImageURL);
        
        //        NSLog(@"job URL: %@", tmpJob.jobDetailsURL);
        
        
        
        //      NSArray *search = tmpJob.jobTitle;
        
        //      jobs = [[NSArray alloc]initWithObjects:tmpJob.jobTitle, nil];
        
        
        
        //        CBJob *test = [[CBJob alloc] init];
        
        //        test.jobTitle = jobtitles;
        
        
        
        
        
        [jobs addObject:tmpJob.jobTitle];
        
    }
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}



- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    
    
    if (![PFUser currentUser]) { // No user logged in
        
        // Create the log in view controller
        
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        
        
        
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        
        // Create the sign up view controller
        
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        
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









/*
 
 #pragma mark - Navigation
 
 
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
 // Get the new view controller using [segue destinationViewController].
 
 // Pass the selected object to the new view controller.
 
 }
 
 */

- (IBAction)searchJobs:(id)sender {
    
    CBSearchObject *so = [[CBSearchObject alloc] init];
    NSString *txt = self.jobtitleTextField.text;
    NSString *txt2 = self.joblocTextField.text;
    
    PFObject *resultjob = [PFObject objectWithClassName:@"ResultJobs"];
    resultjob[@"jobTitle"]=txt;
    resultjob[@"jobLocation"]=txt2;
    [resultjob saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded){
            NSLog(@"save success");
        }
        else{ NSLog(@"save data fail");
        }
    }];
    
    
    //    CBJob *tmpJob;
    //    NSString *jobtitles;
    //    CBJobSearchResult *searchResult = [CBJobSearch jobsFromAPIWithSearchObject:[CBSearchObject searchObjectWithKeywords:txt AndLocation:txt2]];
    //
    //    NSLog(@"Search Results: count=%i and numJobs = %i and xx=%i", searchResult.totalCount, searchResult.results.count, [searchResult countOfResults]);
    
    //    for(tmpJob in searchResult.results)
    //
    //    {
    //
    //        NSLog(@"job title: %@", tmpJob.jobTitle);
    //
    //        NSLog(@"Company: %@", tmpJob.company);
    //
    //        NSLog(@"CompanyImageURL: %@", tmpJob.companyImageURL);
    //
    //        NSLog(@"job URL: %@", tmpJob.jobDetailsURL);
    //
    //
    //
    //        //      NSArray *search = tmpJob.jobTitle;
    //
    //        //      jobs = [[NSArray alloc]initWithObjects:tmpJob.jobTitle, nil];
    //
    //
    //
    //        //        CBJob *test = [[CBJob alloc] init];
    //
    //        //        test.jobTitle = jobtitles;
    //
    //
    //
    //        //          jobs = [[NSMutableArray alloc] initWithCapacity:40];
    //
    //        //          [jobs addObject:tmpJob.jobTitle];
    //
    //    }
    
    
    
    [self.view endEditing:YES];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return [jobs count];
    
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *simpleTableIdentifier = @"searchresults";
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    
    
    cell.textLabel.text = [jobs objectAtIndex:indexPath.row];
    
    return cell;
    
}



@end

