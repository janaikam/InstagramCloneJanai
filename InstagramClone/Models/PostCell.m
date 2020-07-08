//
//  PostCell.m
//  InstagramClone
//
//  Created by Janai Kameka on 7/7/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import "PostCell.h"
#import "DateTools.h"

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    self.postView.file = post[@"image"];
    [self.postView loadInBackground];
    
    NSDate *date = post.createdAt;
    self.createdAtString.text = date.timeAgoSinceNow;
     
}

- (IBAction)onTapMore:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.captionLabel.alpha = 1;
        self.createdAtString.alpha = 1;
        self.moreButton.alpha = 0;
    }];
    
}

@end
