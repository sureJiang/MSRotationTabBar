//
//  UIView+Extension.h
//  
//
//  Created by J on 15/11/18.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)//分类只能扩充方法 并不能生成_x等变量
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;


@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize  size;
@property (nonatomic,assign) CGPoint origin;

@end
