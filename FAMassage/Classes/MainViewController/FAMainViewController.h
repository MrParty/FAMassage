//
//  FAMainViewController.h
//  FAMassage
//
//  Created by fang on 2017/9/17.
//  Copyright © 2017年 fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FAMainViewControllerDelegate <NSObject>

- (void)showLeftView;

@end

@interface FAMainViewController : UIViewController
@property (nonatomic,weak) id<FAMainViewControllerDelegate> delegate;
- (void)loadData;
@end
