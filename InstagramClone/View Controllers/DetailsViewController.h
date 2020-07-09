//
//  DetailsViewController.h
//  InstagramClone
//
//  Created by Janai Kameka on 7/9/20.
//  Copyright © 2020 Janai Kameka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Post.h"
#import "DateTools.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Post *post;

@end

NS_ASSUME_NONNULL_END
