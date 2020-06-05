//
//  MSTabbarDataManager.m
//  MSRotationTabBarDEMO
//
//  Created by jzj on 5/6/2020.
//  Copyright © 2020 JZJ. All rights reserved.
//

#import "MSTabbarDataManager.h"

@implementation MSTabbarDataManager


- (NSArray*)titleArray{
   return  @[@"首页",
            @"论坛",
            @"易计划",
            @"聊天",
            @"我的"];
}

- (NSArray*)imageArray{
   return @[@"tabbar_unselect_0",
            @"tabbar_unselect_1",
            @"",
            @"tabbar_unselect_3",
            @"tabbar_unselect_4"];
    
}

- (NSArray*)imageArraySelected{
    return @[@"tabbar_select_0",
             @"tabbar_select_1",
             @"",
             @"tabbar_select_3",
             @"tabbar_select_4"];
 
}


@end
