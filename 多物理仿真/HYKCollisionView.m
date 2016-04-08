//
//  HYKCollisionView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKCollisionView.h"
#define COLOR colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1

@interface HYKCollisionView ()<

UICollisionBehaviorDelegate

>

{

    UICollisionBehavior *_collision;

}
@end

@implementation HYKCollisionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.blueView.frame = CGRectMake(0, 300, 120, 40);
        [self addSubview:self.blueView];
        
        [self behavior:@[self.boxView]];
        
        //这个代理方法是用来检测边缘碰撞来改变一些属性
        _collision.collisionDelegate = self;
        
    }
    return self;
}


/**
 *  设置物理仿真的方法
 *
 *  @param items 物理仿真对象
 */
- (void)behavior:(NSArray<id <UIDynamicItem>> *)items {
    
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:items];
    
    [self.animator addBehavior:gravity];
    
    _collision = [[UICollisionBehavior alloc]initWithItems:items];
    
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [_collision addBoundaryWithIdentifier:@"123" fromPoint: CGPointMake(0, 300) toPoint: CGPointMake(120, 300)];
    
    [self.animator addBehavior:_collision];

}

/**
 *  实现代理方法
 */
- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    UIImageView *imageView = (UIImageView *)item;
    
    imageView.backgroundColor = [UIColor COLOR];
    
    [self behavior:@[self.blueView]];
    
}


@end
