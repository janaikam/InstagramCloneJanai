//
//  PostCell.m
//  InstagramClone
//
//  Created by Janai Kameka on 7/7/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import "PostCell.h"

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
}


@end
