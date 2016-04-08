//
//  HYKbasicView.h
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYKbasicView : UIView
/**
 *  公共的演示图片
 */
@property(strong,nonatomic) UIImageView *boxView;
/**
 *  物理仿真者
 */
@property(strong,nonatomic) UIDynamicAnimator *animator;
/**
 *  触摸点图片
 */
@property(strong,nonatomic) UIImageView *imagePoint;
/**
 *  蓝色控件
 */
@property(strong,nonatomic) UIImageView *blueView;
/**
 *  实时触点
 */
@property(assign,nonatomic) CGPoint currentPoint;

@end
