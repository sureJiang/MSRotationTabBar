//
//  UIButton+MSBlocks.m
//  
//
//  Created by J on 16/5/27.
//  Copyright © 2016年 J. All rights reserved.
//

#import "UIButton+MSBlocks.h"
#import <objc/message.h>
static char *overViewKey;

@implementation UIButton (MSBlocks)


-(void)handleTouchUpInsideEventWithBlock:(ActionBlock)buttonClickEvent{
    
    [self handleEvent:UIControlEventTouchUpInside withBlock:buttonClickEvent];
}

-(void)handleEvent:(UIControlEvents)aEvent withBlock:(ActionBlock)buttonClickEvent{
    
    objc_setAssociatedObject(self, &overViewKey, buttonClickEvent, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click) forControlEvents:aEvent];
}

-(void)click{
    
    ActionBlock block = objc_getAssociatedObject(self, &overViewKey);
    if (block != nil){
        
        block(self);
    }
}




@end
