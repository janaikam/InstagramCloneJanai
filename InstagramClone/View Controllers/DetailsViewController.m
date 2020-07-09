//
//  DetailsViewController.m
//  InstagramClone
//
//  Created by Janai Kameka on 7/9/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import "DetailsViewController.h"

@import Parse;

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.captionLabel.text = self.post.caption;
    
    NSDate *date = self.post.createdAt;
    self.dateLabel.text = date.timeAgoSinceNow;
    
    self.postView.file = self.post[@"image"];
    [self.postView loadInBackground];
    
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
