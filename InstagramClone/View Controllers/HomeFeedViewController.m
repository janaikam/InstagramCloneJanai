//
//  HomeFeedViewController.m
//  InstagramClone
//
//  Created by Janai Kameka on 7/6/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import "HomeFeedViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "SceneDelegate.h"

@interface HomeFeedViewController ()

@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)didTapLogout:(id)sender {
    // PFUser.current() will now be nil
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {}];
    
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    myDelegate.window.rootViewController = loginViewController;
    
    
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