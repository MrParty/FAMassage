//
//  FARootViewController.m
//  FAMassage
//
//  Created by fang on 2017/9/17.
//  Copyright © 2017年 fang. All rights reserved.
//

#import "FARootViewController.h"
#import "FALeftViewController.h"
#import "FAMainViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface FARootViewController ()<FAMainViewControllerDelegate>
@property (nonatomic,strong) FALeftViewController *leftVC;
@property (nonatomic,strong) FAMainViewController *midVC;
@end

@implementation FARootViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ([super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        FALeftViewController *leftView = [[FALeftViewController alloc] initWithNibName:nil bundle:nil];
        FAMainViewController *midView = [[FAMainViewController alloc] initWithNibName:nil bundle:nil];
        self.leftVC = leftView;
        self.midVC = midView;
        self.midVC.delegate = self;
        [self addChildViewController:self.leftVC];
        [self.view addSubview:self.leftVC.view];
        [self addChildViewController:self.midVC];
        [self.view addSubview:self.midVC.view];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)showLeftView
{
    //判断抽屉是否是展开状态
    if (self.midVC.view.frame.origin.x == 0) {
        
        //通过动画实现view.fram的改变
        [UIView animateWithDuration:0.3 animations:^{
            /*  W  H  屏幕实际大小宏
             * #define ScreenWidth [UIScreen mainScreen].bounds.size.width
             * #define ScreenHeight [UIScreen mainScreen].bounds.size.height
             */
            self.leftVC.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            self.midVC.view.frame = CGRectMake(200, 50, ScreenWidth, ScreenHeight-50*2);
            
        } completion:^(BOOL finished) {
        }];
        
    }else{
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.midVC.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
            
        } completion:^(BOOL finished) {
            [self.midVC loadData];
        }];
    }
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
