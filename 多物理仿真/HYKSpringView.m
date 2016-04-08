//
//  HYKSpringView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKSpringView.h"
#define COLOR colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1

@interface HYKSpringView ()<

UICollisionBehaviorDelegate

>
@end

@implementation HYKSpringView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.attach.damping = 1;
        self.attach.frequency = 1;
        
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.boxView]];
        
        [self.animator addBehavior:gravity];
        /**
         *  KVO
         */
        [self.boxView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:@"123"];
        
       //边缘检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.boxView]];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        collision.collisionDelegate = self;
        
        [self.animator addBehavior:collision];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    [self setNeedsDisplay];

}

- (void)dealloc {

    [self.boxView removeObserver:self forKeyPath:@"center" context:@"123"];

}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    UIImageView *imageView = (UIImageView *)item;
    
    imageView.backgroundColor = [UIColor COLOR];
}
@end
