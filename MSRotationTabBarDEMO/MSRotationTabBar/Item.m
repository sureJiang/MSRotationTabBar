//
//  Item.m
//  DEMO
//
//  Created by J on 15/3/7.
//  Copyright © 2016年 J. All rights reserved.
//

#import "Item.h"
#import "UIView+Extension.h"

@implementation Item

+ (instancetype)itemWithFrame:(CGRect)frame{
    Item * item= [Item buttonWithType:UIButtonTypeCustom];
    item.frame = frame;
    
    item.titleLabel.font = [UIFont systemFontOfSize:10];
    [item setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    item.imageView.contentMode = UIViewContentModeCenter;
    [item setImageEdgeInsets:UIEdgeInsetsZero];
    item.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    item.titleLabel.width = item.width;
    item.titleLabel.height = 20;
    return item;
}




- (void)dealloc {
    
    [self.tabBarItem removeObserver:self forKeyPath:@"badgeValue"];
    [self.tabBarItem removeObserver:self forKeyPath:@"title"];
    [self.tabBarItem removeObserver:self forKeyPath:@"image"];
    [self.tabBarItem removeObserver:self forKeyPath:@"selectedImage"];
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    _tabBarItem = tabBarItem;
    
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"title" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"image" options:0 context:nil];
    [tabBarItem addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
    
    if([keyPath isEqualToString:@"badgeValue"]){
        NSString* badgeValue = [NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        self.badgeView.hidden = !badgeValue.length;
        self.badgeView.text = badgeValue;
    }
}



- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.size = CGSizeMake(27, 27);
    self.imageView.centerX = self.width*0.5;
    self.titleLabel.centerX = self.width*0.5;
    self.titleLabel.height = 15;
    self.titleLabel.y = self.imageView.size.height+4;
    self.imageView.y = 6;
}
@end
