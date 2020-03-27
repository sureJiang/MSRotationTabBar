//
//  PlanController.m
//  DEMO
//
//  Created by J on 16/3/8.
//  Copyright © 2016年 J. All rights reserved.
//

#import "CenterPresentController.h"

@interface CenterPresentController ()

@end

@implementation CenterPresentController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
