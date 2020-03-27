//
//  Tool.m
//  DEMO
//
//  Created by J on 16/3/11.
//  Copyright © 2016年 J. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (UIButton*)buttonWithFrame:(CGRect)frame titleNormal:(NSString*)titleNormal titleHilight:(NSString*)titleHilighted backgroundImageNormal:(NSString*)imageNomal
    backgroundImageHighlight:(NSString*)imageHilight backgroundColcor:(UIColor*)color target:(id)target selector:(SEL)selector{
    
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageNomal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:imageHilight] forState:UIControlStateHighlighted];
    [button setTitle:titleNormal forState:UIControlStateNormal];
    [button setTitle:titleHilighted forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];

    button.titleLabel.font = [UIFont systemFontOfSize:10];
    button.frame = frame;
    button.backgroundColor = color;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+ (UIButton*)buttonWithFrame:(CGRect)frame titleNormal:(NSString*)title titleSelected:(NSString*)titleSelected imageNormal:(NSString*)image  imageSelected:(NSString*)selectedImage titleColorNormal:(UIColor*)normalTitleColor titleSelectedColor:(UIColor*)titleSelectedColor
               backgroundColcor:(UIColor*)color target:(id)target selector:(SEL)selector{
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:titleSelected forState:UIControlStateSelected];

    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:titleSelectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:10];
    button.frame = frame;
    button.backgroundColor = color;
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
