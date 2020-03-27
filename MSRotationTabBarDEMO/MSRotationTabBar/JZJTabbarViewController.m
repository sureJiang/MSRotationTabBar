//
//  ViewController.m
//  DEMO
//
//  Created by J on 16/3/7.
//  Copyright © 2016年 J. All rights reserved.
//



#import "JZJTabbarViewController.h"
#import "CenterPresentController.h"

#import "Tabbar.h"


@interface JZJTabbarViewController ()<UIWebViewDelegate>
@end

@implementation JZJTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
    [self setupTabbar];
}

- (void)addChildViewController{
  NSArray* titleArray           = @[@"首页",
                                    @"论坛",
                                    @"易计划",
                                    @"聊天",
                                    @"我的"];
    
   NSArray* imageArray          = @[@"tabbar_unselect_0",
                                    @"tabbar_unselect_1",
                                    @"",
                                    @"tabbar_unselect_3",
                                    @"tabbar_unselect_4"];
    
    NSArray* imageArraySelected = @[@"tabbar_select_0",
                                    @"tabbar_select_1",
                                    @"",
                                    @"tabbar_select_3",
                                    @"tabbar_select_4"];
    NSInteger i = 0;
    for (NSString* title in titleArray) {
        UIViewController* vc = [UIViewController new];
        vc.tabBarItem = [UITabBarItem new];
        vc.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:imageArray[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:imageArraySelected[i]];
        [self addChildViewController:vc];
        i++;
    }
}


- (void)setupTabbar{
    Tabbar* tabbar = [Tabbar new];
    [self setTabbar:tabbar];
    [tabbar setSelectCenterItemBlock:^{
         [self presentViewController:[CenterPresentController new] animated:YES completion:nil];
    }];
     [tabbar addTarbbarItemWithViewControllers:self.childViewControllers];
}

@end
