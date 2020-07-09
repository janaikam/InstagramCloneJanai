//
//  PostCell.h
//  InstagramClone
//
//  Created by Janai Kameka on 7/7/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *postView;



@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
