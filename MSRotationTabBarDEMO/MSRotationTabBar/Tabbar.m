//
//  Tabbar.m
//  DEMO
//
//  Created by J on 15/3/7.
//  Copyright © 2016年 J. All rights reserved.
//


#import "Header.h"
#import "Tabbar.h"
#import "Item.h"

@interface UIView(RatationAnimation)
- (void)rotation;
@end

static NSInteger const kCenterItemTag = 10002;
static CGFloat   const kDuration      = 0.5;
static NSString* const kCenterIcon    = @"tabbar_select_2.png";

@interface Tabbar()
@property(nonatomic,assign) NSUInteger      index;
@property(nonatomic,strong) UIButton       *button;
@property(nonatomic,strong) UIButton       *centerButton;
@property(nonatomic,strong) NSMutableArray *buttonsArray;

@end

@implementation Tabbar

- (void)didMoveToSuperview{
    [self centerButton];
}


- (void)addTarbbarItemWithViewControllers:(NSArray*)childViewControllers{
    if(![childViewControllers isKindOfClass:[NSArray class]]){
        return;
    }
    [childViewControllers  enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         UITabBarItem* tabbarItem = obj.tabBarItem;
         Item* item =  [self createNormalButtonWithIndex:idx items:childViewControllers];
         item.tabBarItem = tabbarItem;
    }];
}



- (void)addAnimation:(UIButton*)button{
    
       [button.imageView  rotation];
       [button.titleLabel rotation];
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.index = button.tag;
        self.button.selected = NO;
        self.button = button;
        button.selected = YES;
    });
}




- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
                    CGPoint tp = [subView convertPoint:point fromView:self];
                    if (CGRectContainsPoint(subView.bounds, tp)) {
                        view = subView;
                    }
            }
        }
    }
    return view;
}




- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIView* badgeView in self.subviews) {
        if ([badgeView isKindOfClass:[UIImageView class]]) {
            [self insertSubview:badgeView atIndex:0];
    }
        
        [self bringSubviewToFront:self.centerButton];
        
        if ([badgeView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            badgeView.hidden = YES;
        }
    }
}



- (UIView*)createBadgeViewWithIndex:(NSInteger)i item:(Item*)item{
    //badgeView
    UILabel* badgeView = [[UILabel alloc]init];
    badgeView.hidden=!badgeView.text.length;
    badgeView.textAlignment = NSTextAlignmentCenter;
    badgeView.textColor = [UIColor whiteColor];
    badgeView.tag = 20000+i;
    badgeView.font = [UIFont systemFontOfSize:7];
    badgeView.size = CGSizeMake(15, 15);
    badgeView.origin = CGPointMake(CGRectGetMaxX(item.imageView.frame)-badgeView.width*0.5, item.imageView.y-badgeView.height*0.3);
    badgeView.backgroundColor = [UIColor redColor];
    badgeView.layer.cornerRadius = badgeView.height*0.5;
    badgeView.layer.masksToBounds = YES;
    return badgeView;
}


#pragma mark -- centerButton
- (void)setCenterButtonSize:(CGSize)centerButtonSize{
    _centerButtonSize = centerButtonSize;
    self.centerButton.size = self.centerButton.currentBackgroundImage.size;
}

- (void)setCenterButtonImage:(NSString *)centerButtonImage{
    _centerButtonImage  = centerButtonImage;
    [self.centerButton setBackgroundImage:[UIImage imageNamed:centerButtonImage] forState:UIControlStateNormal];

}

- (void)setCenterButtonTopMargin:(CGFloat)centerButtonTopMargin{
    if(centerButtonTopMargin>0){
        return;
    }
    _centerButtonTopMargin = centerButtonTopMargin;
    self.centerButton.y = _centerButtonTopMargin;
}

- (UIButton *)centerButton{
    
    if(!_centerButton){
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:kCenterIcon] forState:UIControlStateNormal];
        
        button.adjustsImageWhenHighlighted = NO;
        button.size = CGSizeMake(42, 42);
        
        button.tag = kCenterItemTag;
        button.size = button.size;
        button.centerX = self.centerX;
        button.y = -12;
        
        [self addSubview:button];
       
        __weak __typeof(&*self)weakSelf = self;

        [button handleTouchUpInsideEventWithBlock:^(UIButton *sender) {
            if (weakSelf.selectCenterItemBlock) {
                weakSelf.selectCenterItemBlock();
            }
            
            if([weakSelf.selectDelegate respondsToSelector:@selector(tabBarDidSelectCenterItem:)]){
                [weakSelf.selectDelegate tabBarDidSelectCenterItem:self];
            }
        }];
        _centerButton = button;
    }
    return _centerButton;
}


- (Item*)createNormalButtonWithIndex:(NSInteger)i items:(NSArray*)items{

   
     CGSize  size = CGSizeMake(kWidth*1.0/items.count, self.height);
     CGFloat x = self.width*1.0/items.count*i;
     Item* item = [Item itemWithFrame:(CGRect){{x,0},size}];
     item.centerX = size.width*0.5 + size.width*i;

    if(item.centerX == kWidth/2.0){
        item.enabled = NO;
    }
    
    item.tag = kBeginTag + i;

    
    [item handleEvent:UIControlEventTouchDown withBlock:^(UIButton *sender) {
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self];

        [self performSelector:@selector(performSelecte:) withObject:sender afterDelay:0.2];
        
    }];
    
    [self.buttonsArray addObject:item];
    [self addSubview:item];
    [self createBadgeViewWithIndex:i item:item];

    return item;
}


- (void)performSelecte:(Item*)sender{
    sender.badgeView.hidden = YES;
    NSInteger index = sender.tag-kBeginTag;
    

    
    
        UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
        UITabBarController *tabBarController = (UITabBarController *)keyWindow.rootViewController;
        if (tabBarController) {
            tabBarController.selectedIndex = index;
        }
    
    [self addAnimation:sender];
}


- (NSMutableArray *)buttonsArray{
    if(!_buttonsArray){
        _buttonsArray = [NSMutableArray array];
    }
    return _buttonsArray;
}
@end

#pragma mark -- animationCategory
@implementation UIView(RatationAnimation)

- (void)rotation{
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = kDuration;
    
    [self.layer addAnimation:rotationAnimation forKey:nil];
}

@end

#pragma mark -- setTabbar

@implementation UITabBarController(Tabbar)

- (Tabbar*)setTabbar:(UITabBar *)tabbar{
    
    [self setValue:tabbar forKeyPath:@"tabBar"];
    return (Tabbar*)self.tabBar;
}

@end
