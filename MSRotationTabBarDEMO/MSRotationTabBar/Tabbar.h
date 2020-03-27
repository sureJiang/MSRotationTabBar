//
//  Tabbar.h
//  DEMO
//
//  Created by J on 15/3/7.
//  Copyright © 2016年 J. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
@class Tabbar;

@protocol TabbarDelegate <NSObject>
- (void)tabBarDidSelectCenterItem:(Tabbar *)tabBar ;
@end

@interface Tabbar : UITabBar
@property(nonatomic,copy)dispatch_block_t  selectCenterItemBlock;
@property(nonatomic,  weak) id         <TabbarDelegate>selectDelegate;
@property(nonatomic,  copy) NSString  *centerButtonImage;
@property(nonatomic,assign) CGFloat    centerButtonTopMargin;
@property(nonatomic,assign) CGSize     centerButtonSize;


- (void)addTarbbarItemWithViewControllers:(NSArray*)viewControllers;

@end


@interface UITabBarController(Tabbar)
- (Tabbar*)setTabbar:(UITabBar *)tabbar;
@end
