//
//  Item.h
//  DEMO
//
//  Created by J on 15/3/7.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Item : UIButton
@property (nonatomic, strong) UITabBarItem *tabBarItem;
@property (nonatomic, strong) UILabel      *badgeView;

+ (instancetype)itemWithFrame:(CGRect)frame;

@end
