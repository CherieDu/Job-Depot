//
//  MySignUpViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/26/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "MySignUpViewController.h"
#import "MyLoginViewController.h"


@interface MySignUpViewController ()

@end

@implementation MySignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    self.signUpView.logo = logoView; // logo can be any UIView
    // Do any additional setup after loading the view from its nib.
    // Check if user is logged in
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
