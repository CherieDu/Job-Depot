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
    
        
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
    logInController.delegate = self;
    [self presentViewController:logInController animated:YES completion:nil];
    
    logInController.fields = (PFLogInFieldsUsernameAndPassword
                              | PFLogInFieldsLogInButton
                              | PFLogInFieldsSignUpButton
                              | PFLogInFieldsPasswordForgotten
                              | PFLogInFieldsDismissButton);
    
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

@end
