//
//  EditResumeViewController.m
//  JobDepot
//
//  Created by Chunyue Du on 7/24/15.
//  Copyright (c) 2015 team4. All rights reserved.
//

#import "EditResumeViewController.h"

@interface EditResumeViewController ()

@end

@implementation EditResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveData:)];
    self.navigationItem.rightBarButtonItem = saveButton;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveData:(id)sender{
    [self performSegueWithIdentifier:@"backtoResume" sender:self];
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
