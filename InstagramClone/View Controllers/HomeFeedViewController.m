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
#import "ComposeViewController.h"
#import "PostCell.h"
#import "Post.h"



@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedTableView;
@property (nonatomic, strong) NSMutableArray *feedArray;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.feedTableView.dataSource = self;
    self.feedTableView.delegate = self;
    
//  implement pull to refresh
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(getFeed) forControlEvents:UIControlEventValueChanged];
    [self.feedTableView insertSubview:self.refreshControl atIndex:0];
    
    //Get Feed
    [self getFeed];

}

-(void)getFeed{
    // construct PFQuery
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    [postQuery includeKey:@"createdAt"];
    postQuery.limit = 20;

    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            // do something with the data fetched
            NSLog(@"Successfully Loaded Feed");
            self.feedArray = [posts mutableCopy];
//            NSLog(@"%@", self.feedArray);
            
            [self.feedTableView reloadData];
            [self.refreshControl endRefreshing];
        }
        else {
            // handle error
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}


- (IBAction)didTapLogout:(id)sender {
    // PFUser.current() will now be nil
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {}];
    
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    myDelegate.window.rootViewController = loginViewController;
}

- (IBAction)didTapPicture:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Post *post = self.feedArray[indexPath.row];
//    cell.post = post;
    
    [cell setPost:post];
    
//    NSLog(@"%@", cell.postView.file);
    
    cell.captionLabel.text = post.caption;
//    [cell.photoImageView setImage:post.image];
    
    cell.captionLabel.alpha = 0;
    cell.createdAtString.alpha = 0;
    cell.moreButton.alpha = 1;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedArray.count;
}


@end
