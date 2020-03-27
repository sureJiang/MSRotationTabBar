//
//  ViewController.m
//  DEMO
//
//  Created by J on 16/3/7.
//  Copyright © 2016年 J. All rights reserved.
//



#import "MSTabbarViewController.h"
#import "CenterPresentController.h"

#import "MSTabbarDataManager.h"
#import "Tabbar.h"

@interface MSTabbarViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)MSTabbarDataManager * dataManager;
@end

@implementation MSTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
    [self setupTabbar];
}

- (void)addChildViewController{
 
    
    NSInteger i = 0;
    for (NSString* title in self.dataManager.titleArray) {
        UIViewController* vc = [UIViewController new];
        vc.tabBarItem = [UITabBarItem new];
        vc.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:self.dataManager.imageArray[i]];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:self.dataManager.imageArraySelected[i]];
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

#pragma mark --lazy

-(MSTabbarDataManager *)dataManager{
        if(!_dataManager){
            _dataManager = [MSTabbarDataManager new];
        }
        return _dataManager;;
}

@end
