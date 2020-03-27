//
//  Tool.h
//  DEMO
//
//  Created by J on 16/3/11.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tool : NSObject

+ (UIButton*)buttonWithFrame:(CGRect)frame titleNormal:(NSString*)title titleHilight:(NSString*)title backgroundImageNormal:(NSString*)image
    backgroundImageHighlight:(NSString*)hilight backgroundColcor:(UIColor*)color target:(id)target selector:(SEL)selector;


+ (UIButton*)buttonWithFrame:(CGRect)frame titleNormal:(NSString*)title titleSelected:(NSString*)title imageNormal:(NSString*)image imageSelected:(NSString*)selectedImage titleColorNormal:(UIColor*)normalTitleColor titleSelectedColor:(UIColor*)titleSelectedColor
              backgroundColcor:(UIColor*)color target:(id)target selector:(SEL)selector;
@end
