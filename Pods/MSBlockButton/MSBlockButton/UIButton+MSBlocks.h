//
//  UIButton+MSBlocks.h
//  
//
//  Created by J on 16/5/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)(UIButton* sender);

@interface UIButton (MSBlocks)

-(void)handleEvent:(UIControlEvents)aEvent withBlock:(ActionBlock)block;


/// default UIControlEventTouchUpInside
-(void)handleTouchUpInsideEventWithBlock:(ActionBlock)block;

@end
