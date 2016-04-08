//
//  HYKpushView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKpushView.h"
#define COLOR colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1
@interface HYKpushView ()<UICollisionBehaviorDelegate>

{
    UIPushBehavior *_push;

}



@end

@implementation HYKpushView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        [self addSubview:self.blueView];
        
        _push = [[UIPushBehavior alloc]initWithItems:@[self.boxView,self.blueView] mode:UIPushBehaviorModeInstantaneous];
        
        UICollisionBehavior *coll = [[UICollisionBehavior alloc]initWithItems:@[self.boxView,self.blueView]];
        
        coll.translatesReferenceBoundsIntoBoundary = YES;
        
        coll.collisionDelegate = self;
        
        [self.animator addBehavior:_push];
        
        [self.animator addBehavior:coll];
    }

    return self;
}


- (void)panAction:(UIPanGestureRecognizer *)pan {

    CGPoint  loc = [pan locationInView:self];
    
    switch (pan.state) {
            
        case UIGestureRecognizerStateBegan:
            
            self.imagePoint.hidden = NO;
            
            self.imagePoint.center = loc;break;
            
        case UIGestureRecognizerStateChanged:
            
            self.currentPoint = loc;
            
            [self setNeedsDisplay];break;
            
        case UIGestureRecognizerStateEnded:
            
            self.imagePoint.hidden = YES;
            
            self.imagePoint.center = CGPointZero;
            
            self.currentPoint = CGPointZero;
            
            CGFloat offX = loc.x - self.imagePoint.center.x;
            CGFloat offY = loc.y - self.imagePoint.center.y;
            
            _push.angle = atan(offY/offX);
            
            _push.magnitude = hypot(offX, offY);
            
            _push.active = YES;

            [self setNeedsDisplay];break;
            
        default:break;
        }
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p {
    
    UIImageView *imageView = (UIImageView *)item;
    
    imageView.backgroundColor = [UIColor COLOR];

}
@end
