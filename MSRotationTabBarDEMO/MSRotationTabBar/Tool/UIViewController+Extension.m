//
//  UIViewController+Extension.m
//  DEMO
//
//  Created by J on 16/3/13.
//  Copyright © 2016年 J. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

-(void)badgeValue:(NSString *)badgeValue{
    for (NSUInteger i =0; i<self.tabBarController.childViewControllers.count; i++) {
        UIViewController* vc = [self.tabBarController.childViewControllers[i]viewControllers][0] ;
        if (vc==self) {
          UILabel* label =   (UILabel*)[self.tabBarController.tabBar viewWithTag:i>2?20000+i+1:20000+i];
            label.text = badgeValue;
            label.hidden = !badgeValue.length;
        }
    }
}


@end
