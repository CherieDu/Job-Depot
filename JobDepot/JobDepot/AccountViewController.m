//
//  AccountViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "AccountViewController.h"
#import "ViewController.h"
@interface AccountViewController ()
@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation AccountViewController
@synthesize emailAccount, avatarAcount, usernameAccount;

-(UIImagePickerController *)imagePicker{
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc]init];
        _imagePicker.delegate = self;
    }
    
    return _imagePicker;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    
    PFUser *user = [PFUser currentUser];
    NSString * nsUsername = [NSString stringWithFormat:@"Username: %@", user.username];

    usernameAccount.text = nsUsername;
    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
    [query whereKey:@"userName" equalTo:user.username];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *userInfo, NSError *error) {
        if (!userInfo) {
            NSLog(@"The getFirstObject request failed.");
            
        } else {
            // The find succeeded.
            NSString * nsEmail = [NSString stringWithFormat:@"Email: %@", userInfo[@"emailAddress"]];

            emailAccount.text = nsEmail;

            
            if (userInfo[@"pictureUrls"][@"values"][0]){
                NSLog(@" test image%@", userInfo[@"pictureUrls"][@"values"][0]);
                NSURL *url = [NSURL URLWithString:userInfo[@"pictureUrls"][@"values"][0]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                avatarAcount.image = [UIImage imageWithData:data];
                
                //                CGSize size = img.size;
            }
            
            //          _city.text = userInfo[@"numConnections"];
            NSLog(@"Successfully retrieved the object???.");
        }
    }];

//    [self setUpNavi];

    
}

//- (void)setUpNavi
//{
//    // set up title, left and right top buttons of the navigation
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStyleBordered target:self action:@selector(signOutApp)];
//    
////    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editProfile)];
//}

//- (void)signOutApp
//{
//    [PFUser logOut];
//    
//    // Instantiate our custom log in view controller
//    ViewController *logInCtr = [self setUpLogIn];
//    
//    // Instantiate our custom sign up view controller
//    ViewController *signUpCtr = [self setUpSignUp];
//    
//    // Link the sign up view controller
//    [logInCtr setSignUpController:signUpCtr];
//    
//    // Present log in view controller
//    [self presentViewController:logInCtr animated:YES completion:nil];
//}

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

//
//- (ViewController *) setUpLogIn
//{
//    ViewController *logInCtr = [[ViewController alloc] init];
//    [logInCtr setDelegate:self];
//    [logInCtr setFacebookPermissions:[NSArray arrayWithObjects:@"friends_about_me", nil]];
//    [logInCtr setFields: PFLogInFieldsDefault
//     | PFLogInFieldsSignUpButton
//     | PFLogInFieldsDismissButton];
//    
//    return logInCtr;
//}
//
//- (ViewController *) setUpSignUp
//{
//    ViewController *signUpCtr = [[ViewController alloc] init];
//    [signUpCtr setDelegate:self];
//    [signUpCtr setFields: PFSignUpFieldsDefault | PFSignUpFieldsAdditional];
//    
//    return signUpCtr;
//}


- (IBAction)logoutBtn:(id)sender {
    [PFUser logOut];
//    PFUser *currentUser = [PFUser currentUser]; // this will now be nil
    
    
}

- (IBAction)didTapPhoto:(UITapGestureRecognizer *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"No Camera Detected");
        return;
    }
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo", @"Use Photo Library", nil];
    
    [actionSheet showInView:self.view];
    
    
}

-(void)pickPhotoFromLibrary{
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self.navigationController presentViewController:self.imagePicker animated:YES completion:nil];
    
    
}

-(void) takePhotoWithCamera{
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self.navigationController presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        return;
    }
    
    switch (buttonIndex) {
        case 0:
            [self takePhotoWithCamera];
            break;
        case 1:
            [self pickPhotoFromLibrary];
        default:
            break;
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    self.avatarAcount.image = image;
    
//    NSData *data = [@"Working at Parse is great!" dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *imageData = UIImagePNGRepresentation(image);
//    PFFile *imageFile = [PFFile fileWithName:@"Profileimage.png" data:imageData];
//    
//    [imageFile saveInBackground];
//    
//    PFQuery *query = [PFQuery queryWithClassName:@"LIUserInfo"];
//    [query whereKey:@"userName" equalTo:[PFUser currentUser].username];
//    
//    NSArray* candidateArray = [query findObjects];
//    for (int i = 0; i < [candidateArray count]; i++) {
//        candidateArray[i][@"avatar"] =imageFile;
//    }
    
}



@end
